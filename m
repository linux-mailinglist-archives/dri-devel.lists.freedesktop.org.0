Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B939E3E078D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 20:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA58E6E9FE;
	Wed,  4 Aug 2021 18:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E686E9FE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 18:25:26 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 5acd56ef-f551-11eb-9082-0050568c148b;
 Wed, 04 Aug 2021 18:25:32 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 251C8194B7F;
 Wed,  4 Aug 2021 20:25:51 +0200 (CEST)
Date: Wed, 4 Aug 2021 20:25:23 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Artjom Vejsel <akawolf0@gmail.com>
Cc: thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul@crapouillou.net
Subject: Re: [PATCH v4 2/3] dt-bindings: Add DT bindings for QiShenglong
 Gopher 2b panel
Message-ID: <YQrbk5/7PiwB2l9I@ravnborg.org>
References: <20210804002353.76385-1-akawolf0@gmail.com>
 <20210804002353.76385-3-akawolf0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804002353.76385-3-akawolf0@gmail.com>
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

On Wed, Aug 04, 2021 at 03:23:52AM +0300, Artjom Vejsel wrote:
> Add DT bindings for QiShenglong Gopher 2b 4.3" 480(RGB)x272 TFT LCD panel.
> 
> Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Paul, I assume you will apply when you are happy with the driver.

	Sam
