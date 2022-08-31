const themeColors = {
    // shades generated from https://tailwind.ink/
    steel: {
        DEFAULT: '#272d3a',
        '50':  '#f8f9f9',
        '100': '#ebf1f5',
        '200': '#d3dfea',
        '300': '#a9bdd0',
        '400': '#7896ad',
        '500': '#5c738d',
        '600': '#4a596f',
        '700': '#414a57',
        '800': '#272d3a',
        '900': '#181b25',
    },
    seagreen: {
        DEFAULT: '#81B29A',
        '50':  '#f4f7f5',
        '100': '#e2efee',
        '200': '#bee3d9',
        '300': '#81b29a',
        '400': '#49a386',
        '500': '#34865f',
        '600': '#2c6d47',
        '700': '#265338',
        '800': '#1b392a',
        '900': '#12231e',
    },
    chestnut: {
        DEFAULT: '#AD5D4E',
        '50':  '#fcfbf9',
        '100': '#faf0e5',
        '200': '#f5d5c8',
        '300': '#e8ab9a',
        '400': '#de7c6c',
        '500': '#ad5d4e',
        '600': '#af3e31',
        '700': '#872e25',
        '800': '#5e201a',
        '900': '#3a1410',
    },
    orchid: {
        DEFAULT: '#C490D1',
        '50':  '#fafafb',
        '100': '#f4eff8',
        '200': '#e8d3f1',
        '300': '#d0ace0',
        '400': '#c490d1',
        '500': '#a95cb7',
        '600': '#8e409b',
        '700': '#6b3077',
        '800': '#4a2250',
        '900': '#2b152e',
    },
}

module.exports = {
    content: [
      './js/**/*.svelte',
      "../lib/**/*.heex",
    ],
    darkMode: 'media',
    theme: {
        extend: {
            colors: {
                ...themeColors,
            }
        },
    },
    variants: {
        extend: {
            opacity: ['disabled'],
        },
    },
    plugins: [require("daisyui")],
    mode: 'jit',
}
