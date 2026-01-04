import HeroSection from "../features/home/HeroSection.jsx";
import CardSlider from "../features/home/CardSlider.jsx";
import HowToRent from "../features/home/HowToRent.jsx";
import HotSales from "../features/home/HotSales.jsx";
import ExploreHome from "../features/home/ExploreHome.jsx";
import Navbar from "../components/Navbar.jsx";
import Footer from "../components/Footer.jsx";
import FullScreenLoader from "../components/FullScreenLoader.jsx";
import { useStaticData } from "../hooks/useStaticData.js";
import { useProductSlice } from "../hooks/useProductSlice.js";
import { useSEO } from "../hooks/useSEO.js";

export default function Home() {
  useSEO({
    title: "Ana Sayfa",
    description:
      "İstanbul bölgesinde tekne kiralama ve tur hizmetleri. En iyi fiyatlar ve kaliteli hizmet için NautiFind'ı ziyaret edin.",
    keywords: "tekne kiralama, istanbul tekne turu, boğaz turu, tekne turu, adalar tekne kiralama",
    url: "/",
    structuredData: {
      "@context": "https://schema.org",
      "@type": "Organization",
      name: "NautiFind",
      url: "https://nautifind.com",
      logo: "https://nautifind.com/logo.png",
      description: "İstanbul bölgesinde tekne kiralama ve tur hizmetleri",
    },
  });
  // Static data'yı Home seviyesinde yükle
  const { isLoading: isStaticDataLoading } = useStaticData();

  // HotSales için product data'yı yükle (opsiyonel - eğer HotSales'ı da kontrol etmek isterseniz)
  const { isLoading: isProductsLoading } = useProductSlice(8);

  // Toplam loading state
  const isLoading = isStaticDataLoading || isProductsLoading;

  // Loading ekranını göster
  if (isLoading) {
    return (
      <>
        <Navbar variant="hero" />
        <FullScreenLoader message="Yükleniyor..." />
      </>
    );
  }

  // Normal içerik
  return (
    <>
      <Navbar variant="hero" />
      <HeroSection />
      <CardSlider />
      <HowToRent />
      <HotSales />
      <ExploreHome />
      <Footer />
    </>
  );
}
