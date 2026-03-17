import Head from "next/head";
import { METADATA } from "../../constants";

const jsonLd = {
  "@context": "https://schema.org",
  "@type": "Person",
  name: "Aditya Magar",
  url: METADATA.siteUrl,
  image: METADATA.image,
  jobTitle: "Flutter Developer",
  description: METADATA.description,
  email: "magaraditya2911@gmail.com",
  sameAs: [
    "https://www.linkedin.com/in/aditya-magar-3b3b602b3/",
    "https://github.com/Aditya290605",
    "https://x.com/AdityaM97708801",
    "https://www.instagram.com/aditya_magar_29/",
  ],
};

const Meta = () => (
  <Head>
    <title>{METADATA.title}</title>
    <meta name="description" content={METADATA.description} />
    <meta name="keywords" content={METADATA.keywords} />
    <meta name="robots" content="index,follow" />
    <meta httpEquiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="language" content={METADATA.language} />
    <meta name="author" content={METADATA.author} />
    <meta name="theme-color" content={METADATA.themeColor} />
    <meta httpEquiv="content-language" content="en" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    {/* Canonical */}
    <link rel="canonical" href={METADATA.siteUrl} />

    {/* Open Graph / Facebook */}
    <meta property="og:locale" content="en_US" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content={METADATA.title} />
    <meta property="og:description" content={METADATA.description} />
    <meta property="og:image" content={METADATA.image} />
    <meta property="og:image:width" content="1200" />
    <meta property="og:image:height" content="630" />
    <meta property="og:image:alt" content={`${METADATA.author} – Portfolio Preview`} />
    <meta property="og:url" content={METADATA.siteUrl} />
    <meta property="og:site_name" content="Aditya Magar" />

    {/* Twitter */}
    <meta property="twitter:card" content="summary_large_image" />
    <meta property="twitter:title" content={METADATA.title} />
    <meta property="twitter:description" content={METADATA.description} />
    <meta property="twitter:site" content={METADATA.twitterHandle} />
    <meta name="twitter:creator" content={METADATA.twitterHandle} />
    <meta property="twitter:url" content={METADATA.siteUrl} />
    <meta property="twitter:image" content={METADATA.image} />

    <link rel="icon" type="image/png" href="/logo.png" />
    <link rel="apple-touch-icon" href="/logo.png" />
    <meta name="msapplication-TileColor" content="#7000FF" />
    <link rel="manifest" href="/manifest.json" />

    {/* JSON-LD Structured Data */}
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
    />
  </Head>
);

export default Meta;
