Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B573DA844AF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 15:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D0910E9BF;
	Thu, 10 Apr 2025 13:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vl4MQ/n6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0448E10E9B8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 13:25:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 07960A4A87E;
 Thu, 10 Apr 2025 13:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D024EC4CEDD;
 Thu, 10 Apr 2025 13:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744291528;
 bh=dI/wEl0KU6sxbpEO9chvi2t1lifThyh4pTu8Gp+7k8w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vl4MQ/n6V50/JafK0WuWNvdTPzzMlY+Et3X7IbmVpWncca1SM4LO5SQyva/RnyBWJ
 iaChh+CGvN1u0KLlrA/6aEBB3JBYnvWCmmcmEuTKFvIdVntfqOQlBtSCX5isOQ1EcS
 7HE57wkTWBjjo5q01jm5ZlD/iySbjPsVEVxAu0FM6JFVIogNmrVfY20IvFHQB957C9
 rklozdoBgaQUN1KVlS3Dd3qeLdmWe4AF4QGUnGI7OItHQk54B8XdXvRUkakGsbcX8c
 iS69MAmK7dY4G2+ORjy2RzcWIF8OB5R8KO7L3pV67afBk7fZ4JrsAyefRYE4YS9t+O
 7L7g0hnID6RMQ==
Date: Thu, 10 Apr 2025 08:25:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mripard@kernel.org, airlied@gmail.com, kernel@collabora.com,
 maarten.lankhorst@linux.intel.com, neil.armstrong@linaro.org,
 pablo.sun@mediatek.com, quic_jesszhan@quicinc.com,
 dri-devel@lists.freedesktop.org, krzk+dt@kernel.org,
 christophe.jaillet@wanadoo.fr, simona@ffwll.ch, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Aoly
 Technology Co., Ltd.
Message-ID: <174429152597.3712322.5500786245544647533.robh@kernel.org>
References: <20250410072456.387562-1-angelogioacchino.delregno@collabora.com>
 <20250410072456.387562-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410072456.387562-2-angelogioacchino.delregno@collabora.com>
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


On Thu, 10 Apr 2025 09:24:54 +0200, AngeloGioacchino Del Regno wrote:
> Aoly is a manufacturer of LCD/IPS displays based in Shenzhen,
> Mainland China.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

