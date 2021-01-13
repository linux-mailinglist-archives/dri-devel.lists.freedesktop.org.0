Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392D2F4BAE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 13:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E9C6E98E;
	Wed, 13 Jan 2021 12:55:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A075E6E98E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 12:55:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3FE9233F6;
 Wed, 13 Jan 2021 12:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610542502;
 bh=R35icEekZdVOc0zpx+bjZE8H0/Hj68YPjmfywpr2VoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d0ZlMXd+8YdRNLOyR2tqGLLvwtI1Yl0UoVNI917S1IP4PJc4PAexcxPmBN0UUaWzq
 dle17l7xJaJx7FBq4swvwmWrH0jwhqGG7y7l92tAEFJQB4cv2f3vSx1FCcUeEYOII4
 RzfZBSk3L9JQPuuwVxusmyr4sQAIIs7uZ/1AVF9wE/EVrv7e2sMppgg5pFXSuYq/BA
 uMWEgNa29esAVZtV9A45Z8GJ7zIXgC8gHVif1olvMkE0FwV+beJ04WJJoBQIjDwfhT
 hvplYhmotVS84daqruUFD0WqXJoMTUPTh3qjx4BAplB69zJ1XiLuUGFCaWZtnMjqek
 J+fufpuqeMkhg==
Date: Wed, 13 Jan 2021 18:24:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 07/11] dt-bindings: phy: convert MIPI DSI PHY binding
 to YAML schema
Message-ID: <20210113125457.GN2771@vkoul-mobl>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
 <20201225075258.33352-7-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201225075258.33352-7-chunfeng.yun@mediatek.com>
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
> Convert MIPI DSI PHY binding to YAML schema mediatek,dsi-phy.yaml

Applied, thanks

-- 
~Vinod
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
