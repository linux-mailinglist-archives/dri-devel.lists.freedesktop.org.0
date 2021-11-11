Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A97544E39A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 10:03:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBAF6EB4E;
	Fri, 12 Nov 2021 09:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957D16E02C
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 13:55:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 953F661104;
 Thu, 11 Nov 2021 13:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636638956;
 bh=0NJJzYxBIEp2WaQdK0ERPqjWBSAu9syv0y1XA60QWOc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=As6JmssNSF1eCITD+y5tHEHRFwcrH1VHxwv1LZAlRqDs8gNYsgq8sHOLScP7zx2oC
 wS6vpnTX/J3jmNsIolQCD2mfVpXZEAQ/I/RblUwlOpI6zG3kv5b2NPv7002Z7G2cFy
 4Hugmka1myR/cqblkO9sh6GwLM+MFK7divCMJzEfEyZdGkUKi0bXyRTmp+O4/zUHIL
 QoJm1zAmNivUjXWnUnZwcSJuyXh0Hun7yRuqmOWV+U2KFTD/2V2DU1If62phQTo6Tc
 R7I8FGxnMe5g8SKRCw5p00D4kSaYwSq9CA6FTWwluqmPSJ5keEuUb8fJs/mxaVcssJ
 8jQ1GcNdkdiFQ==
Date: Thu, 11 Nov 2021 05:55:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Mark VMware mailing list entries as
 email aliases
Message-ID: <20211111055554.4f257fd2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <d7f3fec79287a149d6edc828583a771c84646b42.camel@perches.com>
References: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
 <163657493334.84207.11063282485812745766.stgit@srivatsa-dev>
 <20211110173935.45a9f495@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <d7f3fec79287a149d6edc828583a771c84646b42.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 12 Nov 2021 09:03:36 +0000
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
Cc: Srivatsa@freedesktop.org, S.Bhat@freedesktop.org,
	"  <srivatsa@csail.mit.edu>, jgross@suse.com,  x86@kernel.org, pv-drivers@vmware.com, Zack Rusin <zackr@vmware.com>, Nadav  Amit <namit@vmware.com>, Vivek Thampi <vithampi@vmware.com>, Vishal Bhakta  <vbhakta@vmware.com>, Ronak Doshi <doshir@vmware.com>,  linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org,  linux-rdma@vger.kernel.org, linux-scsi@vger.kernel.org,  netdev@vger.kernel.org, linux-input@vger.kernel.org, amakhalov@vmware.com,  sdeep@vmware.com, virtualization@lists.linux-foundation.org,  keerthanak@vmware.com, srivatsab@vmware.com, anishs@vmware.com,  linux-kernel@vger.kernel.org, rostedt@goodmis.org"@freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Nov 2021 21:19:53 -0800 Joe Perches wrote:
> On Wed, 2021-11-10 at 17:39 -0800, Jakub Kicinski wrote:
> > On Wed, 10 Nov 2021 12:09:06 -0800 Srivatsa S. Bhat wrote:  
> > >  DRM DRIVER FOR VMWARE VIRTUAL GPU
> > > -M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
> > >  M:	Zack Rusin <zackr@vmware.com>
> > > +R:	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
> > >  L:	dri-devel@lists.freedesktop.org
> > >  S:	Supported
> > >  T:	git git://anongit.freedesktop.org/drm/drm-misc  
> > 
> > It'd be preferable for these corporate entries to be marked or
> > otherwise distinguishable so that we can ignore them when we try 
> > to purge MAINTAINERS from developers who stopped participating.
> > 
> > These addresses will never show up in a commit tag which is normally
> > sign of inactivity.  
> 
> Funny.
> 
> The link below is from over 5 years ago.
> 
> https://lore.kernel.org/lkml/1472081625.3746.217.camel@perches.com/
> 
> Almost all of those entries are still in MAINTAINERS.
> 
> I think the concept of purging is a non-issue.

I cleaned networking in January and intend to do it again in 2 months.
See:

054c4610bd05 MAINTAINERS: dccp: move Gerrit Renker to CREDITS
4f3786e01194 MAINTAINERS: ipvs: move Wensong Zhang to CREDITS
0e4ed0b62b5a MAINTAINERS: tls: move Aviad to CREDITS
c41efbf2ad56 MAINTAINERS: ena: remove Zorik Machulsky from reviewers
5e62d124f75a MAINTAINERS: vrf: move Shrijeet to CREDITS
09cd3f4683a9 MAINTAINERS: net: move Alexey Kuznetsov to CREDITS
93089de91e85 MAINTAINERS: altx: move Jay Cliburn to CREDITS
8b0f64b113d6 MAINTAINERS: remove names from mailing list maintainers
