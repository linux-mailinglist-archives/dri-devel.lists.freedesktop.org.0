Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568E4F5AD6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DCD10E277;
	Wed,  6 Apr 2022 10:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459E810E277
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:40:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2C0281F40636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649241606;
 bh=7x+nafxlBp5slkvgaNHZ+WTlE5AOPwQOWURWpk9wYds=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WvM4AxJT5v8G2rRw2CopA5DESuuTsABtYXNNfCttxpuRH+ot2RvsHNdm7pF8jFyq0
 SaIi66hQEifySViIVm2zfQjRbV6nG2VuxtRhTZsXu6DMVLxGyYvUmpChMS985pUaEx
 OXTHxqHJOKQ1BZWRwur5ThF4Bc0FXNb6xSbXMtDTjZnUB7mSl+KxUCork3hCZ/8ZcS
 BIhkE6NnMpZKlqBYEsdYVdL92IRpIc+5/nvpzJKbh6twDjDeI0k/iSRXzLlfq7mT8a
 CJ5vFAbWlvxyDuui7dFiisEDmelHKSIVQH1z0V47tTRATOaopLFUdk1976fNevc8yH
 pcMAfA/mwu+vQ==
Message-ID: <2449070b-d7e1-122f-abe6-4148855a9aba@collabora.com>
Date: Wed, 6 Apr 2022 12:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8192
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220406094654.29722-4-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 06/04/22 11:46, Rex-BC Chen ha scritto:
> The driver data for MT8192 is the same with MT8183. Therefore, we
> correct it.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...though, from what I know, you should also move MT8195 down there!
