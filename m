Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C82312D9D4
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2019 16:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6756E247;
	Tue, 31 Dec 2019 15:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAF36E25A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2019 15:32:53 +0000 (UTC)
Received: from [185.109.153.2] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1imJVm-0004gp-6H; Tue, 31 Dec 2019 16:32:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 10/11] arm64: dts: rockchip: Add PX30 DSI DPHY
Date: Tue, 31 Dec 2019 12:56:14 +0100
Message-ID: <1796464.bE5sXyoQCg@phil>
In-Reply-To: <20191224143900.23567-11-miquel.raynal@bootlin.com>
References: <20191224143900.23567-1-miquel.raynal@bootlin.com>
 <20191224143900.23567-11-miquel.raynal@bootlin.com>
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Dienstag, 24. Dezember 2019, 15:38:59 CET schrieb Miquel Raynal:
> Add the PHY which outputs MIPI DSI and LVDS.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

applied for 5.6 (picked early due to it being shared between lvds and dsi)

Thanks
Heiko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
