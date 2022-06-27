#!/usr/bin/env ruby

# The MIT License (MIT)
#
# Copyright (c) 2022 Álan Crístoffer
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# frozen_string_literal: true

module Homebrew
  module_function

  def fixlinks_args
    Homebrew::CLI::Parser.new do
      description <<~DESC
        Fix formulas symlinks. After updating some formulae are marked as
        installed but not present in the system. This finds and fixes them.
      DESC

      switch '--formula', '--formulae', description: 'Treat all named arguments as formulae.'
      switch '--cask', '--casks', description: 'Treat all named arguments as casks.'
      conflicts '--formula', '--cask'
      named_args %i[formula cask], min: 0
    end
  end

  def fixlinks
    formulas, casks = formulas_and_casks fixlinks_args.parse
    fix_formulas formulas
    fix_casks casks
  end

  def formulas_and_casks(args)
    if args.named.empty?
      formulas = Formula.installed
      casks = Cask::Caskroom.casks
    else
      formulas, casks = args.named.to_formulae_and_casks.partition { |o| o.is_a? Formula }
    end
    formulas = [] if args.cask?
    casks = [] if args.formula?
    [formulas.select(&:linked?), casks]
  end

  def fix_formulas(formulas)
    formulas.each do |formula|
      formula.installed_kegs.each do |keg|
        relink formula, keg if needs_linking? keg
      end
    end
  end

  def relink(formula, keg)
    keg.lock do
      puts "Relinking #{formula.name}"
      keg.unlink
      keg.link
    rescue Keg::LinkError
      puts "Error relinking #{formula.name}"
    end
  end

  def fix_casks(casks)
    casks.each do |cask|
      cask.artifacts.each do |artifact|
        if (artifact.is_a? Cask::Artifact::App) && (!File.exist? artifact.target)
          puts "Reinstalling #{cask.name}"
          Cask::Cmd::Reinstall.reinstall_casks(cask)
        end
      end
    end
  end

  def needs_linking?(keg)
    %w[bin lib].any? do |dir|
      root = keg / dir
      if root.exist?
        dir = HOMEBREW_PREFIX / dir
        !root.children.map { |file| dir / file.basename }.all?(File.method(:exists?))
      else
        false
      end
    end
  end
end
