Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE03F67FF6B
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 14:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A3210E061;
	Sun, 29 Jan 2023 13:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 058C110E059
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 13:39:20 +0000 (UTC)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1pM7ts-0003rM-T7; Sun, 29 Jan 2023 14:39:16 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/6] drm/rockchip: vop2: add support for the
 rgb output block
Date: Sun, 29 Jan 2023 14:39:11 +0100
Message-Id: <167499930025.3595793.9316815837713750123.b4-ty@sntech.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124054706.3921383-1-michael.riesch@wolfvision.net>
References: <20230124054706.3921383-1-michael.riesch@wolfvision.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Jan 2023 06:47:00 +0100, Michael Riesch wrote:
> This series adds support for the RGB output block that can be found in the
> Rockchip Video Output Processor (VOP) 2. Version 2 of this series
> incorporates the feedback by Dan Carpenter and Sascha Hauer. Version 3
> fixes a dumb mistake pointed out by Sascha :-) Thanks for your comments!
> 
> Patches 1-4 clean up the code and make it more general.
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: rockchip: add pinctrls for 16-bit/18-bit rgb interface to rk356x
      commit: 381b6d432f6eb00e1faff763f55e67519af9fa23

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
