Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D77942F4BA9
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 13:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 714766E987;
	Wed, 13 Jan 2021 12:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D196E987
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 12:52:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF664233F6;
 Wed, 13 Jan 2021 12:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610542373;
 bh=K7rfJRt7FTyScHAF7Dc1SebMYXDZ9njQhTE1qfF4ZUc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l3zntwyUARbT34Zn/5cgDiko7uTG+bQ0XokCI4osKNhDgqKgLoy0CmYnemvogSu00
 TMZ0e7XiyjGU2WF06hXeW+bWerZDkuPTrzmRFd2bx6/Va9J81cwgmHJTTsiUnwKqVu
 YMO/IlSkqrmsPZaxiWbnpQYjgcvGG5ZmBlASJT/RTB2N2eTd/lYLVg86sasG/Y4KtO
 CF5auJsOgsqrrP6fYDUfl56IZaQi9R0DOF8TFMkLEJNJsX+WwzlRf/3AeiRRFeSWCi
 GQwFk4ljSf3dhg0i8JLBoqBd3cmxQWp3Czctpu8TWE0pVvrx/PqO3M4mh8W07xY1lu
 AEnGW/dr4Z0MA==
Date: Wed, 13 Jan 2021 18:22:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 03/11] dt-bindings: phy: convert phy-mtk-xsphy.txt to
 YAML schema
Message-ID: <20210113125242.GJ2771@vkoul-mobl>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
 <20201225075258.33352-3-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201225075258.33352-3-chunfeng.yun@mediatek.com>
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
> Convert phy-mtk-xsphy.txt to YAML schema mediatek,xsphy.yaml

Applied, thanks

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
