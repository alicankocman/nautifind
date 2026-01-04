import { Link } from "react-router-dom";
import bannerImg from "../../assets/images/2.jpg";
import OptimizedImage from "../../components/OptimizedImage";

export default function ExploreHome() {
  return (
    <div className="relative px-4 mt-4 md:px-12 md:py-12 lg:px-14 xl:px-20 xl:py-16 3xl:px-32 3xl:py-20 4xl:px-40 4xl:py-[88px] from-black/10 to-black/60 before:absolute before:left-0 before:top-0 before:z-10 before:h-full before:w-full before:bg-gradient-to-b md:before:rounded-2xl md:before:bg-gradient-to-r xl:before:hidden 4xl:!py-[132px]">
      <div className="relative md:px-12 md:py-12 lg:px-14 xl:px-20 xl:py-16 3xl:px-32 3xl:py-20 4xl:px-40 4xl:py-[88px]">
        <OptimizedImage
          alt="Call to action Banner"
          loading="lazy"
          className="absolute aspect-18/5 text-transparent bg-gray-lighter object-cover h-full w-full inset-0 rounded-2xl"
          sizes="100vw"
          src={bannerImg}
        />
        <div className="relative m-auto md:ml-0 max-w-[450px] xl:max-w-[513px] px-8 py-9 md:px-0 md:py-0 flex flex-col justify-center md:justify-start z-20">
          <h2 className="text-center text-2xl font-bold text-white md:text-left md:text-3xl xl:mb-6 3xl:text-5xl mb-3">
            İstanbul'un En Güzel Tekneleri
          </h2>
          <p className="mb-7 leading-[1.78] text-white md:text-base xl:mb-10 3xl:text-lg text-sm text-center md:text-left">
            NautiFind ile Boğaz'ın eşsiz manzaralarını keşfedin. Lüks tekneler, adalar turu ve unutulmaz deniz yolculukları sizi bekliyor.
          </p>
          <Link
            to={`/explore`}
            className="m-auto inline-block rounded-lg bg-gradient-to-r from-sky-600 to-cyan-500 px-9 py-3 text-sm font-semibold text-white shadow-lg shadow-sky-500/50 transition-all duration-150 hover:from-sky-700 hover:to-cyan-600 hover:shadow-xl hover:shadow-sky-500/60 hover:scale-105 md:ml-0 md:text-base"
          >
            Tekneleri Keşfet
          </Link>
        </div>
      </div>
    </div>
  );
}
