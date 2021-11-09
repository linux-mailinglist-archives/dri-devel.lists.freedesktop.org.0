Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C61A449F79
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 01:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6B76E0A1;
	Tue,  9 Nov 2021 00:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0189.hostedemail.com
 [216.40.44.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9336E0A1
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 00:23:04 +0000 (UTC)
Received: from omf19.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id C9939180F5D2D;
 Tue,  9 Nov 2021 00:23:03 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf19.hostedemail.com (Postfix) with ESMTPA id 1A5E920D751; 
 Tue,  9 Nov 2021 00:22:57 +0000 (UTC)
Message-ID: <7f193b68b8eb7ee69e6beb5b93c6dba7475359d3.camel@perches.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Mark VMware mailing list entries as
 private
From: Joe Perches <joe@perches.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Mon, 08 Nov 2021 16:22:57 -0800
In-Reply-To: <20211108161631.2941f3a7@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <163640336232.62866.489924062999332446.stgit@srivatsa-dev>
 <163640339370.62866.3435211389009241865.stgit@srivatsa-dev>
 <5179a7c097e0bb88f95642a394f53c53e64b66b1.camel@perches.com>
 <20211108161631.2941f3a7@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.34
X-Stat-Signature: tojmtwftm96reeo3xe8hqq3d5x9nkse7
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 1A5E920D751
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19aZonmr5dJiZ7OOfE72tvE17w95gAp7eE=
X-HE-Tag: 1636417377-505114
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
 Nadav Amit <namit@vmware.com>, amakhalov@vmware.com,
 "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, srivatsab@vmware.com,
 sdeep@vmware.com, linux-scsi@vger.kernel.org,
 Vishal Bhakta <vbhakta@vmware.com>, x86@kernel.org,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 keerthanak@vmware.com, jgross@suse.com, anishs@vmware.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vivek Thampi <vithampi@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-11-08 at 16:16 -0800, Jakub Kicinski wrote:
> On Mon, 08 Nov 2021 15:37:53 -0800 Joe Perches wrote:
> > > @@ -6134,8 +6134,8 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
> > >  F:	drivers/gpu/drm/vboxvideo/
> > >  
> > >  DRM DRIVER FOR VMWARE VIRTUAL GPU
> > > -M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
> > >  M:	Zack Rusin <zackr@vmware.com>
> > > +L:	linux-graphics-maintainer@vmware.com (private)  
> > 
> > This MAINTAINERS file is for _public_ use, marking something
> > non-public isn't useful.
> 
> But Greg has a point. Corporations like to send us code with a list 
> as the maintainer and MODULE_AUTHOR set to corp's name. We deal with
> humans, not legal entities.

MAINTAINERS is used not for corporations private use but
to find out _who_ to send and cc patches and defect reports.

A "private" email address used only for corporate internal review
cannot receive patches.

> I've been trying to get them to use "M: email" without the name,
> but "L: list (private)" also works.
> 
> Either way I feel like we need _some_ way to tell humans from corporate
> "please CC this address" entries.

This is not the way AFAIKT.

> > private makes no sense and likely these L: entries shouldn't exist.


