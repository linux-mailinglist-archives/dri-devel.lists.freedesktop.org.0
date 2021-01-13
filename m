Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70392F4BAD
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 13:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58416E990;
	Wed, 13 Jan 2021 12:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D94356E990
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 12:54:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E4E32222F9;
 Wed, 13 Jan 2021 12:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610542472;
 bh=ha4DGgePmLUz5DawJjbkL39gsXdnG9tY1EHFdTU1Pm4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ow7pz/hS8zbpvP8E0oy4yive0IVP0A+4IlWeVlUaWJboi4zm1/f5ZZkcWHW7rmZ2i
 nqhdOxXT/5HMclwSrI9qtK1feBzX9qNvn4XqLiwRVeNeZ4g0dXiw19sUtaYF0SE3HY
 Oqq5nCk57pjy+YcHvpovnh2u8w82wffWnXJ70dRZYmG5TWyi7ZsHOheVI1yVoyKi5p
 N/SIrIvnGGpEPxgb3r40QNghtTzDP53r+mt9ehoyTk3bGpV1lJUJfSuM/3M/aj6hR0
 jFPjj2Xhe4xQ1WQOSxW8hTzA/78zidUkTqriu6eY8oHozZueELfGctE6HLB8beG75x
 JTaGQ+PByZ2RA==
Date: Wed, 13 Jan 2021 18:24:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 06/11] dt-bindings: phy: convert HDMI PHY binding to
 YAML schema
Message-ID: <20210113125427.GM2771@vkoul-mobl>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
 <20201225075258.33352-6-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201225075258.33352-6-chunfeng.yun@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Min Guo <min.guo@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25-12-20, 15:52, Chunfeng Yun wrote:
> Convert HDMI PHY binding to YAML schema mediatek,hdmi-phy.yaml

Applied, thanks

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
