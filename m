Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 862963F515E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 21:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C5D8997A;
	Mon, 23 Aug 2021 19:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C39A8997A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 19:39:02 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id bdb2ead6-0449-11ec-b37b-0050568c148b;
 Mon, 23 Aug 2021 19:38:50 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id D09FA194B1F;
 Mon, 23 Aug 2021 21:39:12 +0200 (CEST)
Date: Mon, 23 Aug 2021 21:38:56 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Tzung-Bi Shih <tzungbi@google.com>,
 Rob Herring <robh+dt@kernel.org>,
 Dillon Min <dillon.minfei@gmail.com>, alsa-devel@alsa-project.org,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: panel: ili9341: correct
 indentation
Message-ID: <YSP5UGRATAjuRteM@ravnborg.org>
References: <20210819101020.26368-1-krzysztof.kozlowski@canonical.com>
 <162973996481.3102.17751483171907199985.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162973996481.3102.17751483171907199985.b4-ty@kernel.org>
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

Hi Mark,

On Mon, Aug 23, 2021 at 06:37:55PM +0100, Mark Brown wrote:
> On Thu, 19 Aug 2021 12:10:19 +0200, Krzysztof Kozlowski wrote:
> > Correct indentation warning:
> >   ilitek,ili9341.yaml:25:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [2/2] dt-bindings: sound: rt1015p: correct indentation
>       commit: 0aeb17d1728257f29131a290f0cc8e281cc7274c

I am confused here.
Did you apply both patches or only the one touching sound?

I will pick up the panel patch otherwise.

	Sam
