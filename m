Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 401433DB2F7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 07:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465626F3CE;
	Fri, 30 Jul 2021 05:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56E66F3CE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 05:48:58 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id deebe3df-f0f9-11eb-8d1a-0050568cd888;
 Fri, 30 Jul 2021 05:49:14 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 6538B194B00;
 Fri, 30 Jul 2021 07:49:18 +0200 (CEST)
Date: Fri, 30 Jul 2021 07:48:54 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: panel: Add Samsung S6E3FA2 panel
Message-ID: <YQOSxj9uqQR6jHON@ravnborg.org>
References: <20210725140339.2465677-1-alexeymin@postmarketos.org>
 <CACRpkdaaQeuVqJbczHndsgmmMv0NycwRDdzFTDwM=BJnc7SseQ@mail.gmail.com>
 <YQMr6slu/Nvt6UYr@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQMr6slu/Nvt6UYr@robh.at.kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 " <~postmarketos/upstreaming@lists.sr.ht>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 04:30:02PM -0600, Rob Herring wrote:
> On Mon, Jul 26, 2021 at 09:51:40AM +0200, Linus Walleij wrote:
> > On Sun, Jul 25, 2021 at 4:04 PM Alexey Minnekhanov
> > <alexeymin@postmarketos.org> wrote:
> > 
> > > The Samsung S6E3FA2 AMOLED cmd LCD panel is used on Samsung Galaxy
> > > S5 (klte) phone.
> > >
> > > Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> > 
> > Grr gmail put this in my spam folder, sorry for confused mails.
> > 
> > With Sam's comments addressed:
> 
> What comments? Sam's mails seem to have problems getting to the lists.
New SMTP provider and I have yet to figure out why. Something with
STARTTLS I think. At least dri-devel works bot nothing else..

Not really what I like spending my time on.

	Sam
