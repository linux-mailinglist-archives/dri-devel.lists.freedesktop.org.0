Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B323A3EEAD8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 12:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0926E15C;
	Tue, 17 Aug 2021 10:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4FF6E15C
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 10:22:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 571F060F14;
 Tue, 17 Aug 2021 10:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629195743;
 bh=ZFAq4tNzIQzTRviQ8r6LSwQW3bkr+2nmdMRbQ7RZRsg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Go0Bezt4k+PVI8Qj0upYozJ00NOmTbzPu4M0awDHqDcsgWJdndB7ISgtdfZtLeaYG
 Dt9d7RxnVcyOrXoGBSHtYJr9o+y+nXSEXaEKexgxEWYGa+ZH76KIv2sY2VHfmE8q5r
 1SpEt34BkbGag+m6/yS+DwxaaVFiuSXKf+sZMdfujmWgXRHtoezgHH3f5STy6hl0to
 OGbx8Yt1h0u8LdYH+oXiCJywSnX9Ps942ktu6kpWVIR3+MQocxZVIAzX+t5YV1Vfef
 rNTPgDPsj3BIb0KopXt1U+xVS/1cVsfXAWdlGHMd3n6eSZRUZtnkvwd0UYUVjDJdTg
 3vMg5Cku7rj2A==
Date: Tue, 17 Aug 2021 15:52:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: mediatek: tphy: support type
 switch by pericfg
Message-ID: <YRuN2tvQtO294+sE@matsya>
References: <1629191987-20774-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1629191987-20774-1-git-send-email-chunfeng.yun@mediatek.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17-08-21, 17:19, Chunfeng Yun wrote:
> Add support type switch by pericfg register between USB3, PCIe,
> SATA, SGMII, this is used to replace the way through efuse or
> jumper.

Applied all, thanks

-- 
~Vinod
