Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7A53B890
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 14:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9F010E164;
	Thu,  2 Jun 2022 12:04:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E006910E164
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 12:04:36 +0000 (UTC)
Received: from [192.168.41.62] ([46.114.149.130]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M433w-1nwjYx2sDI-0005D1; Thu, 02 Jun 2022 14:04:27 +0200
Message-ID: <9e096f63-2c8e-b4b7-6d27-79282ecc4e1b@i2se.com>
Date: Thu, 2 Jun 2022 14:04:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 4/6] ARM: dts: bcm2711: Enable V3D
Content-Language: en-US
To: Peter Robinson <pbrobinson@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 bcm-kernel-feedback-list@broadcom.com, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Florian Fainelli <f.fainelli@gmail.com>, javierm@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 maxime@cerno.tech, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
 <20220601110249.569540-5-pbrobinson@gmail.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220601110249.569540-5-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:XYdKR/s2FqlhNRZlT+9ExzCrBB9w+yB58UdOxZwUzzpOa1Go3ju
 0nBM8Gxx1C4AprNqc3h3hcZq0lagwN4q+cZxleaX++TZvn0LuJXXtVHaxD9lq0092KifrVO
 BNWeVzJzSLs7tNfenTrpH9DQFcMsFtgGU1/re+9AufRCSafITmuaIhDO+Ycj3dOr2RdDO/0
 L4U/Vbya/67+MRh4fxz4w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:7zzE7CSNUG0=:FUD8QO420dB1GQCjvEM6vD
 bVK1zcR6+rmkiwjUAAe55F+7DmLZczI619z+WuHNRR8UOEC49tT4tAV41SJvfxTKe8Ze0JXcP
 kYLL2uG9sln0zUGuQ12ZSCpu9/eH1Eu8HJDvWSzN45mzdux4ZwdYdVgiLqdPgIw/uzVN1q0sN
 JkRVaLH6XMJPoDzDub4dXKfgoNoFzNrLx7UUJl5oN/ZvotQh3drt4ShZ7eynYxaqMMaE8VVHG
 f9FM1Fp67IjKduaubvjcMa1GXko4Nctv7KBt1pbhDX0X/yyqWCt4s4ZBqmozDizOlPwuELNVQ
 qrzb/ClT/MGp+UDNlwntjZ1L2SRgH7e2jG8CCZiEOpSWh1O9FOB5OWoACLurgQLaW89a0tjcU
 /PNx3I3YNZ56bn4q/RPr//Z5iZoUmC0kkY7pcL9TljZVL+rwLRmhRHtmdsO4WWuDtLUx7xK4g
 Cuh+tM28Bub5hsW6rQf3ad8d8zttAku5ygfYJ66x+pG+46ehIS6eXoz00GN27OUmBCHJTvG0F
 Y6l9Tc+kYjK5v6ScHhbKfeZhsXjB5EkPxQnxYfg+1Y5Q+LcKs8rw1aQfy/+185ogG/keuS4uj
 54Xsb5wVSSx9JMuqUCKzkUC0SwSgPJHT6ij7I17nE9dnmfREB+726DKNrOpoVCquO/Z5lewE3
 7kKqqS8NYowdoNu7aHF1V5/iHxxzOvJcAXeVZGnBn2Yy+ZDjHjkngBWB8LMFjb9ePXBrar3fq
 htvluwWlGnDmBY6TojSzjC16kPd+MpEujyeeYcn+kNYRby8clZgZ1Vt/+Zg=
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
Cc: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Peter,

Am 01.06.22 um 13:02 schrieb Peter Robinson:
> This adds the entry for V3D for bcm2711 (used in the Raspberry Pi 4)
> and the associated firmware clock entry.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
> Changes since v5:
> - Move the firmware clock to bcm2711-rpi.dtsi
>
>   arch/arm/boot/dts/bcm2711-rpi.dtsi |  4 ++++
>   arch/arm/boot/dts/bcm2711.dtsi     | 11 +++++++++++
>   2 files changed, 15 insertions(+)
>
> diff --git a/arch/arm/boot/dts/bcm2711-rpi.dtsi b/arch/arm/boot/dts/bcm2711-rpi.dtsi
> index ca266c5d9f9b..98817a6675b9 100644
> --- a/arch/arm/boot/dts/bcm2711-rpi.dtsi
> +++ b/arch/arm/boot/dts/bcm2711-rpi.dtsi
> @@ -69,6 +69,10 @@ blconfig: nvram@0 {
>   	};
>   };
>   
> +&v3d {
> +	clocks = <&firmware_clocks 5>;
> +};
> +
>   &vchiq {
>   	interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
>   };
> diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
> index 89af57482bc8..177662257b16 100644
> --- a/arch/arm/boot/dts/bcm2711.dtsi
> +++ b/arch/arm/boot/dts/bcm2711.dtsi
> @@ -601,6 +601,17 @@ genet_mdio: mdio@e14 {
>   				#size-cells = <0x0>;
>   			};
>   		};
> +
> +		v3d: gpu@7ec00000 {
> +			compatible = "brcm,bcm2711-v3d";

unfortunately this doesn't match with patch #3 anymore. Except of this 
everything looks good here.

Stefan

> +			reg = <0x0 0x7ec00000 0x4000>,
> +			      <0x0 0x7ec04000 0x4000>;
> +			reg-names = "hub", "core0";
> +
> +			power-domains = <&pm BCM2835_POWER_DOMAIN_GRAFX_V3D>;
> +			resets = <&pm BCM2835_RESET_V3D>;
> +			interrupts = <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
> +		};
>   	};
>   };
>   
