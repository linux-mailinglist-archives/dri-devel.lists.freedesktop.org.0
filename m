Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFA4A15D5A
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2025 15:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB48E10E0A5;
	Sat, 18 Jan 2025 14:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iHwCdDvN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BB810E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2025 14:37:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 579C95C4A63;
 Sat, 18 Jan 2025 14:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB92C4CED1;
 Sat, 18 Jan 2025 14:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737211068;
 bh=L72H64JQO+JOMYHDJE3pyxhswNH2Hie+rT2+Zsa0jps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iHwCdDvNDLOF8xkozd0+ZKt0CruK+PLCV+Ix0B0W3rB//W8K2/S/a+/HYg5aDIS0I
 TNYqG0AqWVKqapIHPXhAJdLpsqVRc1tKJGh10EbSvLbTcQ9JO2f1TVEzwALMXpWZlu
 auBaC6hUpaMCcP1Yhj3BpE7jTtSIkvRLFMpHyPSO6bZgeehxvn9oLHxmC2+i0uITg4
 bUk7yY+5yfE0IFhO2voaSM6GycuvkGKxhyQXIkUUZO10MWulrD9wyvYNSAZRPym22D
 4plJei9MkpXhUfk0GxfZtw7TVcU2kjAhjUdPN8yq2u5qShmHoJRrK/k45JTbo6iCk7
 SAPYKwiDYvgGg==
Date: Sat, 18 Jan 2025 15:37:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: display: panel: Add compatible for
 KINGDISPLAY KD110N11-51IE
Message-ID: <20250118-tested-smilodon-of-exercise-65c24d@krzk-bin>
References: <20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com>
 <20250117091438.1486732-2-yelangyan@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250117091438.1486732-2-yelangyan@huaqin.corp-partner.google.com>
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

On Fri, Jan 17, 2025 at 05:14:35PM +0800, Langyan Ye wrote:
> The KINGDISPLAY KD110N11-51IE is a 10.95" WUXGA TFT LCD panel,
> which fits in nicely with the existing panel-boe-tv101wum-nl6
> driver. Hence, we add a new compatible with panel specific config.
> 
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
> ---

Nothing improved. Implement review.

Best regards,
Krzysztof

