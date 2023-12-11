Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6DD80C3EA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6831E10E36E;
	Mon, 11 Dec 2023 09:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D108710E36E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:02:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 38560B80CB6;
 Mon, 11 Dec 2023 09:02:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0918AC433C8;
 Mon, 11 Dec 2023 09:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702285326;
 bh=J8XWWQjB14DkSVqB9eprhb9yAhyp/D36xk1dZtdA6tw=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Yr3TCevdatWwf5xiFzks618D5H8ACd6fVPoiOk/BujNqZ3//JzBlWm5pMM4YtoJ2I
 KeCvQIXH+UokVyfjBWVEuL2a6PXexsREzIQkUcMcEXdOTemqx4IWkEBSdSVWd7ikp7
 V9siLqcnH+NK73M8CYWDvXy3xDYWsWkIKYL5aDgFvrJLgcpBb5AyXLJ77ZscCcf28B
 Vd17yvA+vNAkTS83c0LVQFppNUK4OAReqkzeY/lwAzU5OnVzHPXiI041eooMoFAcev
 m4Z5adkHVaXd1EuMzADH4c1oe/WPoWIWjrZb6h234ZF+1/NVfBjNDdnX44lQBlzfSW
 KxeJGviepKUrA==
Message-ID: <30f88710fce46f7a0af8b32166b9a045@kernel.org>
Date: Mon, 11 Dec 2023 09:02:03 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Marek Vasut" <marex@denx.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: simple: Add AUO
 G156HAN04.0 LVDS display
In-Reply-To: <20231209063714.1381913-1-marex@denx.de>
References: <20231209063714.1381913-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, Neil
 Armstrong <neil.armstrong@linaro.org>, Liu Ying <victor.liu@nxp.com>, Sam
 Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Jessica
 Zhang <quic_jesszhan@quicinc.com>, Elmar Albert <ealbert@data-modul.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 9 Dec 2023 07:36:59 +0100, Marek Vasut wrote:
> From: Elmar Albert <ealbert@data-modul.com>
> 
> Document support for the AUO G156HAN04.0 LVDS display.
> 
> G156HAN04.0 is a Color Active Matrix Liquid Crystal Display composed of
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
