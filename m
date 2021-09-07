Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3F7402EAA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 21:01:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A613B89333;
	Tue,  7 Sep 2021 19:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987A989333
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 19:01:49 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4886F1F8E8;
 Tue,  7 Sep 2021 21:01:46 +0200 (CEST)
Date: Tue, 7 Sep 2021 21:01:45 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Cc: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org
Subject: Re: [PATCH 1/2] drm/panel: Add driver for Novatek NT35950 DSI
 DriverIC panels
Message-ID: <20210907190145.7iqvcmjnkmz4t7jo@Marijn-Arch-PC.localdomain>
References: <20210901173127.998901-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901173127.998901-1-angelogioacchino.delregno@somainline.org>
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

On 2021-09-01 19:31:26, AngeloGioacchino Del Regno wrote:
> Add a driver for panels using the Novatek NT35950 Display Driver IC,
> including support for the Sharp LS055D1SX04, found in some Sony Xperia
> Z5 Premium and XZ Premium smartphones.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Somehow this got lost in the heat of the moment:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
