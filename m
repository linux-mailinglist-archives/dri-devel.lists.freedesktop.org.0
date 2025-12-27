Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1207CDF8A9
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 12:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2191D10E5F7;
	Sat, 27 Dec 2025 11:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YFjEEbTC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDE810E549;
 Sat, 27 Dec 2025 11:14:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E9C4844267;
 Sat, 27 Dec 2025 11:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA11C4CEF1;
 Sat, 27 Dec 2025 11:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766834049;
 bh=mocl3Iyc9eOq9L9HNTr6fpoKCle434F+Ha6YaspgZR0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YFjEEbTChgw/DVH76cGOszGm5HZmxn033HuXVGQ1J8+OMAxQBttmDPJ80FrvxX8T/
 3Z76TEl/U9Ftxu4gL6kOiZ5KqkRpovmBT3aTyj0X6YivEaB02Xx9z/yb+y3ZJ+8myU
 MO1K5ZyRePsIo8I3mfFW7+NYdSoaTpcYrH6fBwIOMc24JHa3vrng4nn2n6bFkTR1bq
 K4D+75scV7HbjA6m5imB7TQD/Rb3GS/ztzGaVphsgj4jzyYZqcNiuB8E9vgbDnOYQu
 ez0Qk2wshz/4dkWPuKbkN8vrv3yNYIKLmgZcRWaZ7+7pQUsuYuXo8NV0AyAyqJ4Eyg
 0QE1tFUwnEU0g==
Date: Sat, 27 Dec 2025 12:14:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run, 
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, 
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org, 
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
 Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, 
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v4 3/5] dt-bindings: display: msm: document DSI
 controller and phy on QCS8300
Message-ID: <20251227-vigilant-nebulous-crane-9c5a8b@quoll>
References: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
 <20251225152134.2577701-4-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251225152134.2577701-4-quic_amakhija@quicinc.com>
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

On Thu, Dec 25, 2025 at 08:51:32PM +0530, Ayushi Makhija wrote:
> Document DSI controller and phy on QCS8300 platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>

So you are going to ignore me? If so, I am dropping your patches from
DT patchwork.

Best regards,
Krzysztof

