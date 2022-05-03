Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BC951841B
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF21610F904;
	Tue,  3 May 2022 12:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E508010E82C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:19:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A75421F440F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651580346;
 bh=0L9QYyKQP4UKYOIU/t2r/ePKygeEbRIhjmxvtJB1nsY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e93BsPlwcyqrlux8DndbUgg2m8B8Wp3ZMFLqEc4IXKrtjYxRII/iRD3JDd8gmsvaC
 B65TNEimBPXt1lUDxu8RXccuUEFhThBNoO82g2B/kdpRk/DsPc0TwiTHsaDztyEbfU
 pMuYXMwJ7QqKk9Phhvq5reIDY/XRY/qzYY9V9w9d5h0Ow3rh9zr/j2hYtcLvkSvqpZ
 Egpv5cc4filEqdOcsDzCGrR/FrzgJlfjj0W4T2QbwHG2n/5/g6xdBxhp39OzGJO/T3
 eOXD/q8LYwptxNHEI3OqSwVAQ1P5XNla4Kzlh5F/ysX8ijKXoew1E9HQtMfPi83dGL
 2Ec3w/9UPtJVg==
Message-ID: <8c7c8c7d-840b-30e6-7b2b-341713385d1a@collabora.com>
Date: Tue, 3 May 2022 14:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 04/25] soc: mediatek: add mtk-mmsys ethdr and mdp_rdma
 components
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
 <20220503102345.22817-5-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220503102345.22817-5-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 03/05/22 12:23, Nancy.Lin ha scritto:
> Add new mmsys component: ethdr_mixer and mdp_rdma. These components will
> use in mt8195 vdosys1.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

