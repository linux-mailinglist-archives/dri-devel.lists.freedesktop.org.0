Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F8DB04FAA
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 06:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EFC10E501;
	Tue, 15 Jul 2025 04:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lsX97MIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 260A110E501
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 04:02:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F19C9457DF;
 Tue, 15 Jul 2025 04:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93614C4CEF1;
 Tue, 15 Jul 2025 04:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752552176;
 bh=2UGiN6zW5O4q0oWpGhmgtuQBTPCLQxSYx40hiYynJ4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lsX97MIcclRndAAs44TUN1hYIi6ddUaZcsyFAuXClWuXLRnl9Xyys1K/xd+PDGXe+
 kt+hOFLyiQ9ruCxNjDg8eQ6MlMbIjsyFxwpsoK0v9ZR5/iGS2X52kIiwXeQ9ewF5G0
 xdSWJaLQOYcXvTa8tJzd6oMxwG16wNCBQm7a15AUrwfr4T9HLT7dDyHC0H/s6K7Q8P
 P+rKc9nJQAvgSwf52zESiquJEU+1Afx9nmZUd5E3cZc063pSlahbl0eDrI0zsq0dAg
 WkoGxGAUZKM0IseiDmqyEw3SB5ITLeB/qhp6NmYiKJWVmZWH0iH+5y3spiEEvgN0Cx
 nmJHlzpUlStvA==
Date: Mon, 14 Jul 2025 23:02:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Yao <richard@scandent.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Akshay Athalye <akshay@scandent.com>, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Caleb James DeLisle <cjd@cjdns.fr>, Junhao Xie <bigfoot@classfun.cn>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>, devicetree@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Tianxinwei name
Message-ID: <175255217503.27396.17909209264231260319.robh@kernel.org>
References: <20250714191729.2416-1-richard@scandent.com>
 <20250714191729.2416-2-richard@scandent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714191729.2416-2-richard@scandent.com>
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


On Mon, 14 Jul 2025 15:17:21 -0400, Richard Yao wrote:
> Tianxinwei is a company based in Shenzen, China, making LCD screens.
> 
> Add their name to the list of vendors.
> 
> Signed-off-by: Richard Yao <richard@scandent.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

