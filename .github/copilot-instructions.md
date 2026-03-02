## 📐 Schéma `const C` (structure minimale)
```javascript
const C = {
  schemaVersion: "3.1",
  id: "moros-gravewalker",
  name: "Moros Gravewalker",
  level: 6,
  class: "warlock",
  subclass: "hexblade",
  stats: { ac: 17, hp_max: 47, prof: 3, dc: 15, spell_atk: 7, slots_total: 2 },
  abilities: { cha: { score: 18, mod: 4 }, dex: { score: 14, mod: 2 }, /* ... */ },
  equipment: [ { name: string, cat: string, qty: number, editable: boolean } ],
  // ... (Full schema as seen in characters/moros-v3.1-20260218-0330-i18n.html)
};
```

## 💾 localStorage (état volatile — NE PAS mettre dans `const C`)
| Clé | Type | Description |
|-----|------|-------------|
| `tawyndnd-${C.id}-v3` | object | Objet JSON contenant l'état actuel (hp, hp_temp, slots_used, inv_qty, etc.) |
| `tawyndnd-language` | string | Langue active ("fr" / "en") |