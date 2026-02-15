import { useCallback, useEffect, useRef } from "react";
import Image from "next/image";
import { Howl } from "howler";
import SoundBar from "./SoundBar/SoundBar";

const multiPop = new Howl({
  src: ["/sounds/multi-pop.mp3"],
});

const Header = ({ children }) => {
  const inputRef = useRef(null);

  const handleClick = useCallback((e) => {
    if (e.target.checked) multiPop.play();
  }, []);

  const handleKeyDown = useCallback((e) => {
    if (e.key === "Escape" && inputRef.current?.checked) {
      inputRef.current.checked = false;
    }
  }, []);

  useEffect(() => {
    document.addEventListener("keydown", handleKeyDown);

    return () => {
      document.removeEventListener("keydown", handleKeyDown);
    };
  }, [handleKeyDown]);

  return (
    <nav className="w-full fixed top-0 py-8 z-50 select-none bg-gradient-to-b from-black shadow-black transition-all duration-300">
      <div className="flex justify-between section-container">
        <a href="#home" className="link">
          <Image
            src="/logo.svg"
            alt="Logo - Aditya Magar"
            width={25}
            height={25}
          />
        </a>
        <div className="outer-menu relative flex items-center gap-8 z-[1]">
          <a
            href="https://drive.google.com/file/d/1L4OQ1YsnwN4hNv8b_5_vqhSYkhqnqG92/view?usp=sharing"
            target="_blank"
            rel="noopener noreferrer"
            className="link text-white text-sm font-mono border border-white/30 px-4 py-1.5 rounded-full hover:bg-white hover:text-black transition-all duration-300"
          >
            Download CV
          </a>
          <SoundBar />
          <input
            ref={inputRef}
            aria-labelledby="menu"
            aria-label="menu"
            className="checkbox-toggle link absolute top-0 right-0 w-6 h-6 opacity-0"
            type="checkbox"
            onClick={handleClick}
          />
          <div className="hamburger w-6 h-6 flex items-center justify-center">
            <div className="relative flex-none w-full bg-white duration-300 flex items-center justify-center" />
          </div>
          {children}
        </div>
      </div>
    </nav>
  );
};

export default Header;
