Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E821684AF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 18:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C9E96F4E1;
	Fri, 21 Feb 2020 17:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F066F4E1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 17:18:35 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 423B120048;
 Fri, 21 Feb 2020 18:18:32 +0100 (CET)
Date: Fri, 21 Feb 2020 18:18:30 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 04/51] drm/bridge: Add connector-related bridge
 operations and data
Message-ID: <20200221171830.GA24845@ravnborg.org>
References: <20200216210308.17312-1-laurent.pinchart@ideasonboard.com>
 <20200216210308.17312-5-laurent.pinchart@ideasonboard.com>
 <20200217095308.GK2363188@phenom.ffwll.local>
 <20200218012127.GR4830@pendragon.ideasonboard.com>
 <CAKMK7uHsrNQCOO7kPQXkCjCtLyB8A1x80Y63XzV2VizSxhMptg@mail.gmail.com>
 <20200221142324.GG4955@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221142324.GG4955@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10
 a=2GPEqMlrVM4Qh5Opg7YA:9 a=wPNLvfGTeEIA:10
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

> Why =F4 why did I have to start the DRM/KMS documentation effort years
> ago, to see it biting me back now ? :-)
Thats obviously because you and countless others are some were nice
people that like the nice cousy feeling when you know you are doing
something to help others.
It is no your fault that some of these others are a little clueless
despite the documentation effort.
When I sometimes wander around in the kernel and then try to read the
documentation of other subsystems and fails to find it or the quality
is not just there. Then I really appreciate all the hard
effort done in the DRM subsystem.
So thumbs up, please keep up the good work all of you.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
