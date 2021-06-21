Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F283AEAFF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 16:17:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6DF6E17A;
	Mon, 21 Jun 2021 14:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3446F6E17A
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 14:17:43 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 7a3c53d1-d29b-11eb-960d-0050568c148b;
 Mon, 21 Jun 2021 14:17:57 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id F1AA5194B83;
 Mon, 21 Jun 2021 16:17:45 +0200 (CEST)
Date: Mon, 21 Jun 2021 16:17:39 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Stefan =?iso-8859-1?Q?Riedm=FCller?= <S.Riedmueller@phytec.de>
Subject: Re: [PATCH 1/3] drm/panel: Add connector_type and bus_format for AUO
 G104SN02 V2 panel
Message-ID: <20210621141739.GA823900@ravnborg.org>
References: <20210415091616.53415-1-s.riedmueller@phytec.de>
 <57bf547d95ba84f72d0f9da0e687fbe71311e5b8.camel@phytec.de>
 <5942e9c67f7d50737536613b80a2cb42a3615b3d.camel@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5942e9c67f7d50737536613b80a2cb42a3615b3d.camel@phytec.de>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stefan,

On Mon, Jun 21, 2021 at 08:22:10AM +0000, Stefan Riedmüller wrote:
> Hi,
> 
> another gentle ping.
> 
> Also adding Laurent Pinchart to CC.

Can I ask you to resend the whole lot. I have resurfaced after an
off-line period and deleted all pending mails.

I could probarly hunt down the mails somewhere but resend is easier on
my end.

	Sam
