Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1268144D168
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 06:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468256E8D0;
	Thu, 11 Nov 2021 05:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0066.hostedemail.com
 [216.40.44.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB316E8D0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 05:20:01 +0000 (UTC)
Received: from omf18.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 8B8FC101EABB1;
 Thu, 11 Nov 2021 05:20:00 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf18.hostedemail.com (Postfix) with ESMTPA id 1C9ADC0002F4; 
 Thu, 11 Nov 2021 05:19:53 +0000 (UTC)
Message-ID: <d7f3fec79287a149d6edc828583a771c84646b42.camel@perches.com>
Subject: Re: [PATCH v3 3/3] MAINTAINERS: Mark VMware mailing list entries as
 email aliases
From: Joe Perches <joe@perches.com>
To: Jakub Kicinski <kuba@kernel.org>, "Srivatsa S. Bhat"
 <srivatsa@csail.mit.edu>
Date: Wed, 10 Nov 2021 21:19:53 -0800
In-Reply-To: <20211110173935.45a9f495@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
 <163657493334.84207.11063282485812745766.stgit@srivatsa-dev>
 <20211110173935.45a9f495@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ztcifz3jtb55m8w5484sjq3xynbqoduh
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 1C9ADC0002F4
X-Spam-Status: No, score=-1.31
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+SDIVTNx+3zME4BO7OMP/EAp4Y+zdx/2M=
X-HE-Tag: 1636607993-497590
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
Cc: Ronak Doshi <doshir@vmware.com>, pv-drivers@vmware.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Nadav Amit <namit@vmware.com>, amakhalov@vmware.com, srivatsab@vmware.com,
 sdeep@vmware.com, linux-scsi@vger.kernel.org,
 Vishal Bhakta <vbhakta@vmware.com>, x86@kernel.org,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 rostedt@goodmis.org, keerthanak@vmware.com, jgross@suse.com, anishs@vmware.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Vivek Thampi <vithampi@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2021-11-10 at 17:39 -0800, Jakub Kicinski wrote:
> On Wed, 10 Nov 2021 12:09:06 -0800 Srivatsa S. Bhat wrote:
> >  DRM DRIVER FOR VMWARE VIRTUAL GPU
> > -M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
> >  M:	Zack Rusin <zackr@vmware.com>
> > +R:	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
> >  L:	dri-devel@lists.freedesktop.org
> >  S:	Supported
> >  T:	git git://anongit.freedesktop.org/drm/drm-misc
> 
> It'd be preferable for these corporate entries to be marked or
> otherwise distinguishable so that we can ignore them when we try 
> to purge MAINTAINERS from developers who stopped participating.
> 
> These addresses will never show up in a commit tag which is normally
> sign of inactivity.

Funny.

The link below is from over 5 years ago.

https://lore.kernel.org/lkml/1472081625.3746.217.camel@perches.com/

Almost all of those entries are still in MAINTAINERS.

I think the concept of purging is a non-issue.

