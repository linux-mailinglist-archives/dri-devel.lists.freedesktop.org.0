Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D54E073C8A6
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jun 2023 10:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2972810E08E;
	Sat, 24 Jun 2023 08:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE76110E08E
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jun 2023 08:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1687594095; x=1688198895; i=deller@gmx.de;
 bh=nV3CTyxNKPTPooCvqcC4CRaJBTriP3iL6heU9HaLMsk=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=WEND6irihw3+hXVTVzVRCtDU6tDJ9hPbciyqs75FgtbyRqGH3K2kBeb0ngWAak/YLiCruqG
 3chkD/b1oSHz1pnxe0UhMIdnhtU32g+Zsjiuo05hJ4h3X2jkZKWd4pMm6pr5m7Yju+tQtAeYq
 EH1WW8dp7uCijj7T2gHUwb029m15dhuoDgoInJ+3SzQswAOaqvpNqbUjlb2gyuzmpGVAqS755
 dz0jXPu5CkW1S1Hi0DKU8gbpHWIhLZM84ATshOTLpLqqT5h6FB1RgMI5aZUKosGMHkgzVBBdb
 8N1f1ola9udpPt+hSoAleFGxHSah31B6qQezb8NF1HvsYdRB2YTA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.156.152]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRTRH-1qPQd93pht-00NNmj; Sat, 24
 Jun 2023 10:08:15 +0200
Message-ID: <4570ff59-8f31-b218-7c21-0a69eb9130f3@gmx.de>
Date: Sat, 24 Jun 2023 10:08:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] MAINTAINERS: adjust entry in VIA UNICHROME(PRO)/CHROME9
 FRAMEBUFFER DRIVER
Content-Language: en-US
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230623040736.9026-1-lukas.bulwahn@gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230623040736.9026-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sdgtWdVp7ip4/4ayIBB1vUFupzXQG/VWEONZNgCv661G2u7SWyo
 2fHSGlayiRWr/Pz7IZnIpC94+PobtToPkpGjUSj2YFJmi5kJB1tqS8Cf4oVDdi72MC5Rv67
 dsWrfcCdDqO8V5gyoZWqNPKgAlQnOrc/wnwKyMMcCtDRMJWrLPYrdFaqMXdsHL750B9ArS1
 YWGP1tsJqwXKxJJOTSwkQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PYeCmMABKKI=;z6O1tiq+JqUujWJ+qFqTF8l+vsN
 M2rVfKqx94bc4Mpq4LGO37g3bCi2ZctqOl5cs+uIJZOoeawuCulUxGWCnAVyC5gxx9u4i5Yme
 XaomuDRTwvM46beTVb5NCbnkpNQ+mv4uZKJLxGxx2mh7V+RU/DCjT2DLu8612JjtWk4fOvaXW
 eRLdfl56WmNiMrjLVbekqV9qvOuIAr0uEeRBYbOsovSBMYcc33TFmt8D/bewFeDbo3raEFzfc
 Ndr+1r82vHSJpBZLALAsKQpErerQrLJYEbDVk3q5BDYPdRKxKo3CV1J1aglbHj5BoqJKk2Lbb
 lye1tCsdimB3hnkrpqMBrsZFl2anzH8XKECNxOqTtcnvVyBkNL2L+O46HfKjO90tLHK8Xq4NB
 6SRea2Y+NfQvRlN7Xq4ZT3lXZ9jOi2FifkgI44nJ0DwdURwf4i8U7CG2lrJl2cpmIWk8fqSlR
 fIQ5GvmPX/tlGaKK404qkQrlpRkXrpS2ez4IyP/n6Q/9MnKXHt4fGCSqzbMLKqUX+hvnz1xKR
 Tp50v6EeW7fdApM0hsUGAIvDGJ9XIqZ51crchbhDG5d886L102q6bj563zk/90z5jiqGAlJYu
 5pkjO3ltq3V2u7Ff0r/4AplrETTzRF7koBC0FMZm23spgjJcXI9aoxaauBy1iSZCW/YOsmfLm
 m969E7UR0AwfdoRJhw/q4OorflltI/YgmEYedOdc+uPsz8oaTlkCJY4OzqQ6pELAKGqn68/9h
 u4iDbGejirxAk3WkopHgUI3Ox7ZCr4pesIDisMxKtLRqI3ROBGDcbNIaKpJDoZvqbBLSDYgZ4
 jWguu9MRZPMpDOroSmKFwB0/yc23s81jBqIqw05Y4o8XEGgZAJhytxWpxNwZrjhLXYeuuX9iI
 BmYg6eLCUdG0zlgtcqesbibcW14SOr4YeTH6t50C4s0Il50XcnS3qHcxjD4dzXEHHTNhyYRw1
 fIw9y+HH/Dl6yiEAcO1Z+N8FvY8=
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/23/23 06:07, Lukas Bulwahn wrote:
> Commit d4313a68ec91 ("fbdev/media: Use GPIO descriptors for VIA GPIO")
> moves via-gpio.h from include/linux to drivers/video/fbdev/via, but miss=
es
> to adjust the file entry for the VIA UNICHROME(PRO)/CHROME9 FRAMEBUFFER
> DRIVER section.
>
> Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains abou=
t a
> broken reference.
>
> Remove the file entry in VIA UNICHROME(PRO)/CHROME9 FRAMEBUFFER DRIVER, =
as
> the new location of the header is already covered by the file entry
> drivers/video/fbdev/via/.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Added the Fixes tag and applied.

Thanks!
Helge

> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 88954a1c0017..e12ac544aa9d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22415,7 +22415,6 @@ L:	linux-fbdev@vger.kernel.org
>   S:	Maintained
>   F:	drivers/video/fbdev/via/
>   F:	include/linux/via-core.h
> -F:	include/linux/via-gpio.h
>   F:	include/linux/via_i2c.h
>
>   VIA VELOCITY NETWORK DRIVER

