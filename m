Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2D684386D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 09:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F19610F28F;
	Wed, 31 Jan 2024 08:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20C610F28F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 08:03:41 +0000 (UTC)
Received: from i53875af6.versanet.de ([83.135.90.246] helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rV5Yp-0002dS-MR; Wed, 31 Jan 2024 09:03:07 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Dang Huynh <danct12@riseup.net>, Manuel Traut <manut@mecka.net>
Subject: Re: [PATCH v4 0/4] arm64: rockchip: Pine64 PineTab2 support
Date: Wed, 31 Jan 2024 09:03:05 +0100
Message-ID: <10956967.nitPUkWRp2@diego>
In-Reply-To: <ZblPtrW7suT3RRXc@mecka.net>
References: <20240127-pinetab2-v4-0-37aab1c39194@mecka.net>
 <6035442.lOV4Wx5bFT@melttower> <ZblPtrW7suT3RRXc@mecka.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Diederik de Haas <didi.debian@cknow.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-rockchip@lists.infradead.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Yao <markyao0591@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Segfault <awarnecke002@hotmail.com>, Sandy Huang <hjc@rock-chips.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Ondrej Jirman <megi@xff.cz>, Daniel Vetter <daniel@ffwll.ch>,
 Arnaud Ferraris <aferraris@debian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 30. Januar 2024, 20:36:22 CET schrieb Manuel Traut:
> Hi Dang,
> 
> On Sat, Jan 27, 2024 at 06:35:50PM +0700, Dang Huynh wrote:
> > Hi Manuel,
> > 
> > Since the BOE patches have been accepted to next, you do not need to include 
> > it in this patch series.
> 
> sorry, I thought patches to LKML shall be against Linux master since the
> patches are still only in drm-next I considered to keep them in the queue.

normally if parts of the v(x-1) version of your series are already
applied somewhere you just mention that fact in the cover-letter
in the changelog, like "dropped display patches already applied to drm-misc"

Just to make sure, there is no need for a resend, I'll look at and pick
just the remaining patches :-)


Heiko


