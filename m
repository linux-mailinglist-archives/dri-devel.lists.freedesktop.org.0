Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4245F243568
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 626C26E113;
	Thu, 13 Aug 2020 07:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2476E113
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 07:51:08 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id c4so4065469otf.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 00:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eU62SrftExeZEPFtSlHLsBRzbUkLx1KNOgZc6VKFeBQ=;
 b=BcTBIMZXed3cIEqxU5M6gyn4o9nHihpLgbsp16YGjFyK2xJOM221Zir2YwmmPQ62XB
 O3IfMRFfJvgyhk7kE/iWcK7NTHBtZt6hvlYDis9bMaNn29u+0YCD/Wxdt+XcsX+1JYhu
 tYYSt3v1Jby+gXULXJgZuSeRj8l9SCAlk171w5j+aajB+kosZ0h6sjtqC6l57Yj8o3l5
 8nQx8rh5Q8ePYnCK9X6DW0DI3jLL67CTUzjZvwLAfk9PJVAM5gUvtxUM8jLegsnj/6ir
 Egfrwbl8bk7cDEiHN5kivjAysfR9N0WcUXoj0DVhkuZGoiKmbm7ZgrfXGn24+iETrRrB
 hpYA==
X-Gm-Message-State: AOAM5333rpft55RNkqB9E7YnCnELf8txAjdihRXA5A+ZtzGfiHxSYDPU
 EUCn1ls3yP8xgX8guWVCptF/VDkBuhcQ5qmeZRI=
X-Google-Smtp-Source: ABdhPJzAAKS8g3t/W5mSJd2Vboc2FEvoNvVXoru7u4kNP7jabPCwVCki2JjTk/fEfMzVv8QAFC24k07bLAU2LYhSK+k=
X-Received: by 2002:a05:6830:1b79:: with SMTP id
 d25mr2990956ote.107.1597305067462; 
 Thu, 13 Aug 2020 00:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200812203618.2656699-1-robh@kernel.org>
In-Reply-To: <20200812203618.2656699-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2020 09:50:55 +0200
Message-ID: <CAMuHMdVXvSRF-G_TYu4P+Bqa2FZJWsUCyzqFur3Rb-tBExfbsw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Whitespace clean-ups in schema files
To: Rob Herring <robh@kernel.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-iio@vger.kernel.org,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-rtc@vger.kernel.org,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-input@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-spi <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Wed, Aug 12, 2020 at 10:36 PM Rob Herring <robh@kernel.org> wrote:
> Clean-up incorrect indentation, extra spaces, long lines, and missing
> EOF newline in schema files. Most of the clean-ups are for list
> indentation which should always be 2 spaces more than the preceding
> keyword.
>
> Found with yamllint (which I plan to integrate into the checks).

> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-clocks.yaml
> @@ -24,9 +24,9 @@ properties:
>        - const: renesas,r8a7778-cpg-clocks # R-Car M1
>        - const: renesas,r8a7779-cpg-clocks # R-Car H1
>        - items:
> -        - enum:
> -            - renesas,r7s72100-cpg-clocks # RZ/A1H
> -        - const: renesas,rz-cpg-clocks    # RZ/A1
> +          - enum:
> +              - renesas,r7s72100-cpg-clocks # RZ/A1H
> +          - const: renesas,rz-cpg-clocks    # RZ/A1

This change breaks alignment of the comments at the end of each line.

>        - const: renesas,sh73a0-cpg-clocks  # SH-Mobile AG5

(I only checked the files I care about)

If you don't update commit  e0fe7fc6f2ca0781 ("dt-bindings: Whitespace
clean-ups in schema files"), I can send a patch after v5.9-rc1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
