/**
 * TawynDnD — Traductions françaises (FR)
 * Terminologie officielle AideDD.org + WotC FR
 */

export const FR = {
  // ── Labels UI ──
  ui: {
    // Stats & Combat
    hp: 'Points de vie',
    hp_short: 'PV',              // Version courte pour espaces réduits
    hp_temp: 'PV temporaires',
    hp_temp_short: 'PV temp',    // Version courte
    ac: "Classe d'armure",
    ac_short: 'CA',              // Version courte
    init: 'Initiative',
    speed: 'Vitesse',
    prof: 'Maîtrise',
    dc: 'DD',
    name: 'Nom',
    level: 'Niveau',
    class: 'Classe',
    race: 'Race',
    background: 'Historique',
    alignment: 'Alignement',
    
    // Actions
    attack: 'Attaque',
    damage: 'Dégâts',
    range: 'Portée',
    bonus: 'Bonus',
    
    // Ressources
    spell_slots: 'Emplacements de sort',
    hit_dice: 'Dés de vie',
    death_saves: 'Jets contre la mort',
    successes: 'Succès',
    failures: 'Échecs',
    
    // Boutons & Actions
    rest_short: 'Repos court',
    rest_long: 'Repos long',
    switch_language: 'Changer de langue',
    
    // Onglets
    tab_combat: 'Combat',
    tab_spells: 'Sorts',
    tab_abilities: 'Capacités',
    tab_tactics: 'Tactique',
    tab_sheet: 'Fiche',
    tab_bio: 'Biographie',
    tab_maneuvers: 'Manœuvres',
    
    // Mode
    mode_social: 'Social',
    mode_exploration: 'Exploration',
    mode_combat: 'Combat',
    
    // Divers
    passive_perception: 'Perception passive',
    inventory: 'Inventaire',
    equipment: 'Équipement',
    proficiencies: 'Maîtrises',
    languages: 'Langues'
  },

  // ── Caractéristiques ──
  abilities: {
    str: 'Force',
    dex: 'Dextérité',
    con: 'Constitution',
    int: 'Intelligence',
    wis: 'Sagesse',
    cha: 'Charisme',
    str_abbr: 'FOR',
    dex_abbr: 'DEX',
    con_abbr: 'CON',
    int_abbr: 'INT',
    wis_abbr: 'SAG',
    cha_abbr: 'CHA'
  },

  // ── Compétences ──
  skills: {
    acrobatics: 'Acrobaties',
    animal_handling: 'Dressage',
    arcana: 'Arcanes',
    athletics: 'Athlétisme',
    deception: 'Tromperie',
    history: 'Histoire',
    insight: 'Intuition',
    intimidation: 'Intimidation',
    investigation: 'Investigation',
    medicine: 'Médecine',
    nature: 'Nature',
    perception: 'Perception',
    performance: 'Représentation',
    persuasion: 'Persuasion',
    religion: 'Religion',
    sleight_of_hand: 'Escamotage',
    stealth: 'Discrétion',
    survival: 'Survie'
  },

  // ── Classes ──
  classes: {
    artificer: 'Artilleur',
    barbarian: 'Barbare',
    bard: 'Barde',
    cleric: 'Clerc',
    druid: 'Druide',
    fighter: 'Guerrier',
    monk: 'Moine',
    paladin: 'Paladin',
    ranger: 'Rôdeur',
    rogue: 'Roublard',
    sorcerer: 'Ensorceleur',
    warlock: 'Occultiste',
    wizard: 'Magicien'
  },

  // ── Sous-classes (exemples) ──
  subclasses: {
    battle_master: 'Maître de guerre',
    champion: 'Champion',
    eldritch_knight: 'Chevalier occulte',
    hexblade: 'Lame maudite',
    fiend: 'Le Fiélon',
    great_old_one: 'Le Grand Ancien'
  },

  // ── Types de dégâts ──
  damage_types: {
    acid: 'Acide',
    bludgeoning: 'Contondant',
    cold: 'Froid',
    fire: 'Feu',
    force: 'Force',
    lightning: 'Foudre',
    necrotic: 'Nécrotique',
    piercing: 'Perforant',
    poison: 'Poison',
    psychic: 'Psychique',
    radiant: 'Radiant',
    slashing: 'Tranchant',
    thunder: 'Tonnerre'
  },

  // ── Écoles de magie ──
  spell_schools: {
    abjuration: 'Abjuration',
    conjuration: 'Invocation',
    divination: 'Divination',
    enchantment: 'Enchantement',
    evocation: 'Évocation',
    illusion: 'Illusion',
    necromancy: 'Nécromancie',
    transmutation: 'Transmutation'
  },

  // ── Conditions ──
  conditions: {
    blinded: 'Aveuglé',
    charmed: 'Charmé',
    deafened: 'Assourdi',
    exhaustion: 'Épuisement',
    frightened: 'Effrayé',
    grappled: 'Agrippé',
    incapacitated: 'Neutralisé',
    invisible: 'Invisible',
    paralyzed: 'Paralysé',
    petrified: 'Pétrifié',
    poisoned: 'Empoisonné',
    prone: 'À terre',
    restrained: 'Entravé',
    stunned: 'Étourdi',
    unconscious: 'Inconscient'
  },

  // ── Types d'actions ──
  action_types: {
    action: 'Action',
    bonus: 'Action bonus',
    reaction: 'Réaction',
    free: 'Action gratuite'
  },

  // ── Catégories d'équipement ──
  equipment: {
    weapon: 'Arme',
    armor: 'Armure',
    consumable: 'Consommable',
    tool: 'Outil',
    magic_item: 'Objet magique',
    misc: 'Divers',
    ammunition: 'Munitions'
  },
  
  // ── Sorts — Moros / v3.1 ──
  spells: {
    eldritch_blast:      { name: "Décharge occulte" },
    mind_spike:          { name: "Piqûre mentale" },
    booming_blade:       { name: "Lame retentissante" },
    armor_of_agathys:    { name: "Armure d'Agathys" },
    hex:                 { name: "Maléfice" },
    darkness:            { name: "Ténèbres" },
    suggestion:          { name: "Suggestion" },
    invisibility:        { name: "Invisibilité" },
    thunder_step:        { name: "Foulée tonitruante" },
    counterspell:        { name: "Contresort" }
  }
};
