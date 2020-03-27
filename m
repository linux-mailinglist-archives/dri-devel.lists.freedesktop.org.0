Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B00471957A2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 14:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886446EA28;
	Fri, 27 Mar 2020 13:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Fri, 27 Mar 2020 13:00:00 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50AEF6EA28
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 13:00:00 +0000 (UTC)
Received: from mail-qt1-f174.google.com ([209.85.160.174]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MFK8H-1j25ze3pAP-00FheN for <dri-devel@lists.freedesktop.org>; Fri, 27
 Mar 2020 13:54:52 +0100
Received: by mail-qt1-f174.google.com with SMTP id t17so8343719qtn.12
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Mar 2020 05:54:51 -0700 (PDT)
X-Gm-Message-State: ANhLgQ37fyZwdW6iUOdApT69+lwKCPNwVFz5jt2D4tVZQpUKvqTt31BY
 rXXjghvtkT+HMlltMMPZVR9jZFfSycRegoYmrLg=
X-Google-Smtp-Source: ADFU+vueKMRRVnX6uqbtv+2n6jxNH6u3YPxdn23XTrFSuAqIloIPBnaq1uinFAYZzt7R/58hOnRiuYU6bptE3XgXqoc=
X-Received: by 2002:ac8:d8e:: with SMTP id s14mr13725256qti.204.1585313689290; 
 Fri, 27 Mar 2020 05:54:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585311091.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1585311091.git.michal.simek@xilinx.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 27 Mar 2020 13:54:33 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
Message-ID: <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michal Simek <michal.simek@xilinx.com>
X-Provags-ID: V03:K1:YgIaWDKHmVyDF64+bXy9Ci0+TfEehqBWTyfBO+xVrr6Yk+4eqqE
 hXZuAe3D+04JYO+HoNJLxEqXWHv4Ki0SgGVKbw9uYc0FukWoUxqudVcdb7w4Jw44oHMqe3p
 vYHQpMnQud/5GjILZ3D9nQbSKYxCHbr0JNcpXxbyB8gUjk05SHdxfDVA8bdf+f3QAmTrGP8
 rPEyvepFoTKGqCOVa4v1Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:U2frmvoLYZw=:q41YaH5R03ZN+y2p0S1YHl
 96/oNiy6UDYxa6384+dvC2jahXOz8imAVgcAhNxCs+q5ActuZMb9OpLkMo1p0IksrNEArFcTg
 g3yrKcQrRQEAQh5f5kB3ley43ICTB9rOdPvqMZHVW9ZgXk5XwcRqCStUZFM520AiRjiDlwG0D
 SdInm450EVP+nKTTyuXGYuzwtfslE1MC3oB0HUBnc/n6wRMxe3n51wJoip19H32/B0OuH/lOO
 LtvjpodvVB93GDzfNrUXyRBSFNuP+iqdYX+qcOkF2eHYIXaJQnbdl/g1cq6naeNtZ6eamUB3q
 stQDqesZY7UUYL26OvO5rUykwQGxwcgb/Kc3JCc4MtHQg4kiB0cNtoEGgUo7apiAx81urvKkP
 RmwVWiK18v2e4ZB6o87QlFu28wLUfOwV348lmZp+btbcBmqWk0fMu2SWA8z3ZpFiciaOjKss0
 m6Z48De7rn9sLBENCD6nlxXeO1ajT7s2XnlaMp6P458qZlDz5u9MTR6Q3NZVImWrsIISzR63D
 u2GeGB1B95Wz7I7Oh8H/09Xy+cZblM5joyVxph2TFIhBHsFWwkyM4v8aSVweC/rsVE3Kj/3CH
 5/0FZ6dkBz5V9+FdeV7cPGo6Jak+pgQBFvfhXrOfnGgYaaT9Lb25Hiq4GddJbz86oTZ1AMUET
 r6oWsX7x6UPK0Aud9b3L+rTEt8Qw8z1q/nipIts8t1XZ+doA9x1uzVF8O6C44cqLs9JQuxXhJ
 yPwSArTBdORgq0+BfyRIopCMn2SSgPYV3L6NIPFXfvi0PQ32jslbH3gxvNiO+TpjVFRcdRLpi
 4Q2YPqW1vxO2GwKrWSp8LR/xX/X6/HCv6lcMtaZNSoFuwVTnyA=
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Matt Porter <mporter@kernel.crashing.org>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 27, 2020 at 1:12 PM Michal Simek <michal.simek@xilinx.com> wrote:
>
> recently we wanted to update xilinx intc driver and we found that function
> which we wanted to remove is still wired by ancient Xilinx PowerPC
> platforms. Here is the thread about it.
> https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
>
> I have been talking about it internally and there is no interest in these
> platforms and it is also orphan for quite a long time. None is really
> running/testing these platforms regularly that's why I think it makes sense
> to remove them also with drivers which are specific to this platform.
>
> U-Boot support was removed in 2017 without anybody complain about it
> https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
>
> Based on current ppc/next.
>
> If anyone has any objection about it, please let me know.

Acked-by: Arnd Bergmann <arnd@arndb.de>

This looks reasonable to me as well, in particular as the code only
supports the two
ppc44x virtex developer boards and no commercial products.

It does raise a follow-up question about ppc40x though: is it time to
retire all of it?
The other ppc405 machines appear to have seen even fewer updates after the
OpenBlockS 600 got added in 2011, so it's possible nobody is using them any more
with modern kernels.

I see that OpenWRT removed both ppc40x and ppc44x exactly a year ago after
they had not been maintained for years.

However, 44x (in its ppc476 incarnation) is clearly still is used
through the fsp2 platform,
and can not be deprecated at least until that is known to have stopped
getting kernel
updates.

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
