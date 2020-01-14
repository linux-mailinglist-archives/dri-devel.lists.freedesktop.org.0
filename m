Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3317813A8F8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 13:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556606E391;
	Tue, 14 Jan 2020 12:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDD1893A4;
 Tue, 14 Jan 2020 12:05:41 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 19874086-1500050 for multiple; Tue, 14 Jan 2020 12:05:38 +0000
MIME-Version: 1.0
To: , Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>, 
 Jani Nikula <jani.nikula@intel.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87sgkil0v9.fsf@intel.com>
References: <87sgkil0v9.fsf@intel.com>
Message-ID: <157900353569.27314.7943894029240988375@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PULL] drm-intel-next
Date: Tue, 14 Jan 2020 12:05:35 +0000
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
Cc: , dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Jani Nikula (2020-01-14 11:43:22)
> 
> Hi Dave & Daniel -
> 
> Last batch for v5.6, slightly delayed I'm afraid.

I'd like to close https://gitlab.freedesktop.org/drm/intel/issues/738
for 5.6, otherwise we'll have some more nasty emails from bewildered
users/devs.

https://patchwork.freedesktop.org/series/71951/
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
