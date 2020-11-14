Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55802B3070
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 20:59:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D146E956;
	Sat, 14 Nov 2020 19:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1536E956
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 19:59:34 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6DB808054C;
 Sat, 14 Nov 2020 20:59:32 +0100 (CET)
Date: Sat, 14 Nov 2020 20:59:31 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH 2/5] dt-bindings: panel-simple-dsi: add samsung panels
 for OnePlus 6/T
Message-ID: <20201114195931.GB3900471@ravnborg.org>
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-3-caleb@connolly.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112161920.2671430-3-caleb@connolly.tech>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=f9cxcILiNMCIw7iZS7cA:9 a=CjuIK1q_8ugA:10
 a=Ab_k19QNQqsA:10
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Caleb,
On Thu, Nov 12, 2020 at 04:21:30PM +0000, Caleb Connolly wrote:
> Add compatibles for the samsung,sofef00 and samsung,s6e3fc2x01 panels
> used in the OnePlus 6 & 6T respectively.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>

Thansk, applied to drm-misc-next.
Fixed so entries are sorted alphabetically when applying.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
