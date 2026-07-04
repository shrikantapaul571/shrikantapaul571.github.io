# Content Guide

How to add or edit anything on the site. All content lives in plain text files. You never need to touch HTML or CSS.

## The Golden Rule

Every section reads from a YAML file in `data/`:

| Want to change | Edit this file |
|---|---|
| Experience | `data/experience.yaml` |
| Education | `data/education.yaml` |
| Publications | `data/research.yaml` |
| Projects | `data/projects.yaml` |
| Awards | `data/achievements.yaml` |
| Design gallery links | `data/designs.yaml` |
| Biography (About Me text) | `content/_index.md` |
| Name, role, research interests, social links | `hugo.toml` (the `[params]` block) |
| Profile photo | replace `static/img/profile.png` |
| CV PDF | replace `static/files/Shrikanta_Paul_CV.pdf` |
| CV preview images | replace `static/img/resume-page-1.png` and `resume-page-2.png` |

Entries appear on the page in the same order as in the file. Put the newest entry at the top.

## Publishing Changes

After editing, run these from the repo folder:

```powershell
git add -A
git commit -m "Describe what you changed"
git push
./deploy.ps1
```

The live site updates within about a minute. (`git push` saves your source; `deploy.ps1` rebuilds the site and publishes it.)

To preview locally before publishing: `hugo server`, then open http://localhost:1313/.

## Entry Templates

Copy, paste, fill in. Indentation matters in YAML — keep it exactly as shown (2 spaces).

### Publication (`data/research.yaml`)

```yaml
- title: Paper Title Here
  year: 2026
  type: Conference
  authors: A. Author, B. Author and <strong>S. Paul</strong>
  status: Published · IEEE Xplore
  venue: <em>Conference Name (ACRONYM)</em>, City, Country, 2026, pp. 1–6.
  doi: 10.1109/XXXXX.2026.XXXXXXX
  link: https://ieeexplore.ieee.org/document/XXXXXXX
```

- `year` groups the paper under a year heading (with an automatic count) and powers the Year filter.
- `type` powers the Type filter — use `Conference`, `Journal`, or any other label (e.g. `Book Chapter`, `Preprint`); filter buttons are generated automatically from whatever types exist.
- `authors`, `doi`, `link` are optional — leave them out for accepted-but-unpublished papers.
- `<strong>...</strong>` bolds your name; `<em>...</em>` italicises the venue.
- Numbering `[1] [2] ...` is automatic.

### Experience (`data/experience.yaml`)

```yaml
- title: Job or Role Title
  period: January 2027 – Present
  organization: Organization Name (extra detail if needed)
  points:
    - First responsibility or accomplishment.
    - Second one.
```

### Education (`data/education.yaml`)

```yaml
- degree: Ph.D. in Computer Science
  period: 2027 – Present
  institution: University Name, City
  detail: "Anything extra: CGPA, expected graduation, thesis topic"
```

### Project (`data/projects.yaml`)

```yaml
- name: Project Name
  tag: Short • Category • Labels
  description: One or two sentences about what it is and does.
  link: https://example.com/
  linkLabel: Live Demo
```

`linkLabel` is the button text — use `Live Demo`, `Source`, `Paper`, etc.

### Award (`data/achievements.yaml`)

```yaml
- title: Award Name
  detail: One line about what it was for.
  year: Fall 2027
```

### Research Interest (`hugo.toml`)

Find the `interests` line and add to the list:

```toml
interests = ["Machine Learning", "Deep Learning", "Natural Language Processing", "Computer Vision", "Explainable AI (XAI)"]
```

### Biography (`content/_index.md`)

Plain Markdown below the `---` block. `**bold**` for emphasis. Each paragraph becomes a paragraph on the page.

## Gotchas

- If a value contains a colon (`:`), wrap the whole value in double quotes: `detail: "CGPA: 3.94"`.
- Don't use tab characters in YAML files — spaces only.
- If the site fails to build after an edit, it's almost always broken YAML indentation. Run `hugo` in the repo folder to see the error line.
