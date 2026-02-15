# TawynD&D

Outstanding digital character sheet for D&D 5th Edition

## Overview

TawynD&D is a single-file HTML/JS/CSS character sheet application designed for tabletop D&D players who prefer to roll physical dice while tracking their character digitally.

## Features

### 🎲 Physical Dice Rolling (NO RNG)
- **CRITICAL FEATURE**: No random number generation in the app
- Modal input for entering physical dice roll results
- Toast notifications display final results with bonuses
- Roll buttons throughout the interface for quick access

### 📊 Dense 3-Column Grid Layout
- Optimized for desktop and tablet viewing
- Responsive design adapts to mobile devices
- Compact information display maximizes screen real estate

### ⚔️ Social/Combat Mode Toggle
- Toggle between Social and Combat modes in the header
- Visual theme changes with mode selection
- Combat mode highlights combat-relevant information with red accents

### 🎒 Inventory Management
- Track items with quantities
- +/- buttons to adjust item counts
- Items automatically removed when quantity reaches 0
- Persistent storage using localStorage

### 💾 Smart Data Architecture
- `const CHARACTER`: Static character data (name, class, stats, etc.)
- `let state`: Dynamic state saved to localStorage (HP, inventory, mode)
- Automatic state persistence across sessions

## Usage

1. **Open the file**: Simply open `template_master.html` in any modern web browser
2. **Roll dice**: Click any "Roll" button, enter your physical dice result, and see the total with bonuses
3. **Switch modes**: Toggle between Social and Combat modes using the header buttons
4. **Manage inventory**: Use +/- buttons to adjust item quantities
5. **Data persists**: Your HP, inventory, and mode preference are automatically saved

## Technical Details

- **Single-file application**: All HTML, CSS, and JavaScript in one file
- **No dependencies**: Works offline, no external libraries required
- **localStorage**: Automatic state persistence
- **Responsive**: Adapts from desktop (3 columns) to tablet (2 columns) to mobile (1 column)

## Character Template

The current template includes:
- **Name**: Tawyn
- **Class**: Ranger (Level 1)
- **Race**: Wood Elf
- **Ability Scores**: Pre-configured with modifiers
- **Skills**: Perception, Stealth, Survival, Athletics, Investigation
- **Starting Inventory**: Longbow, Arrows, Rope, Rations, Healing Potion

## Browser Compatibility

Works with all modern browsers:
- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)

## License

This project is part of the TawynDnD repository.
