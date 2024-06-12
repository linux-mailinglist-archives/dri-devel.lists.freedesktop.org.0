Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 497DF905A1C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 19:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29E010E614;
	Wed, 12 Jun 2024 17:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c1vrovK9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591FF10E88C;
 Wed, 12 Jun 2024 17:44:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF980614FD;
 Wed, 12 Jun 2024 17:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4255FC116B1;
 Wed, 12 Jun 2024 17:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718214290;
 bh=S5pPQlYqkbKDLcynx5VnNb+C8Z5Qrs/To+KuhbkFjbI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c1vrovK9foKbDhjD65lGc4PoEWhjUJcoEOsVg0XkgjErc0SRNTBN/FzjoIUOEDe35
 VM5o4m4uALf16m/ToFFp792Xr4s+axmjxMzKg/SQ431cYtsf5KfLNA7x0E1JPPgnHd
 fhuBo9pEIgUtZpTliY+4Pztop1zb6WSy1FiKm4j7Ggoz3AbF/QPh+klWSRYh5DmF1t
 LEBPLC53wR2iNVw2kpC/R/l4kgjsqSlAbYUp5jHQaVu0OdpuqQcLKBRflCNf80/uvm
 3QNscn2A1Xc/+Zbc3PhaDD+9MjyAkFVUVBv9IPInViggK/SmFkb0i6/6RPZsrClhtd
 +9O7lffYFr2jw==
Date: Wed, 12 Jun 2024 23:14:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 2/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-tx-8998
Message-ID: <Zmnejlkb869mN3eS@matsya>
References: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
 <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-hdmi-tx-v3-2-9d7feb6d3647@freebox.fr>
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

On 06-06-24, 18:07, Marc Gonzalez wrote:
> HDMI TX block embedded in the APQ8098.

This one too

-- 
~Vinod
