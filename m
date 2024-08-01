Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3675394419F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 05:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF9D10E87D;
	Thu,  1 Aug 2024 03:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hLaPU8qx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A2910E87D;
 Thu,  1 Aug 2024 03:20:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8A63FCE1849;
 Thu,  1 Aug 2024 03:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF0CC4AF0F;
 Thu,  1 Aug 2024 03:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722482402;
 bh=BvIdfDclaFLw7RpmEnVouQK1tmMNfr0+G9FNeexH9b0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hLaPU8qxHA3u+fzhT1R0k2gU2WZyt8+l7tTrivnC7aKHacBi/sT0132YIzncQoTAR
 QZ3d11/n2WGaBq/Nf4kqOckVOUe97gOu85haofWwQ4MtqzbM2SUGKGgC9z7y6+eG0s
 URdkX+86/PKiMhDiyUYBob9ol88UncUzHiE8zub2QMvR0P2TPCzJjFy4Of4WRWWIdc
 d6y3NHKb1hrj+ciA78+aK2JUZH7qXcwvhwRKoRGEUTPkJ5SQl2j7UkrZxTj2DPXXxH
 iWfkCEPuI2/BPRKzuGlm6bu6D9cjYSTxgAt0QnXVrChgx5HCNdWMVnKtasslAqXEuV
 vPX3Hj26ZqIsA==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-pm@vger.kernel.org, iommu@lists.linux.dev,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: (subset) [PATCH 0/3] Update Konrad Dybcio's email addresses
Date: Wed, 31 Jul 2024 22:19:45 -0500
Message-ID: <172248238591.319692.676661290519182446.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
References: <20240726-topic-konrad_email-v1-0-f94665da2919@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 26 Jul 2024 13:18:22 +0200, Konrad Dybcio wrote:
> Patch 3 should probably go straight to Rob's dt-bindings tree
> 
> 

Applied, thanks!

[1/3] mailmap: Add an entry for Konrad Dybcio
      commit: 72c93f3e0dcdc05fceafcb32e79352a45716d181
[2/3] MAINTAINERS: Update Konrad Dybcio's email address
      commit: fce6a1eefb2a1db706fa17ca21e3e7107811d2e8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
