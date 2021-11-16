Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E46C453C74
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 23:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E7189B06;
	Tue, 16 Nov 2021 22:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0191.hostedemail.com
 [216.40.44.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E946B89C09
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 22:58:24 +0000 (UTC)
Received: from omf05.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id AB5BB86E90;
 Tue, 16 Nov 2021 22:58:23 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf05.hostedemail.com (Postfix) with ESMTPA id 2FC745092ECC; 
 Tue, 16 Nov 2021 22:58:15 +0000 (UTC)
Message-ID: <f03d59adc565c1cf2e97c97c5ea6083e614549dd.camel@perches.com>
Subject: Re: [PATCH v4 3/3] MAINTAINERS: Mark VMware mailing list entries as
 email aliases
From: Joe Perches <joe@perches.com>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, jgross@suse.com, 
 x86@kernel.org, pv-drivers@vmware.com
Date: Tue, 16 Nov 2021 14:58:17 -0800
In-Reply-To: <163710245724.123451.10205809430483374831.stgit@csail.mit.edu>
References: <163710239472.123451.5004514369130059881.stgit@csail.mit.edu>
 <163710245724.123451.10205809430483374831.stgit@csail.mit.edu>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2FC745092ECC
X-Spam-Status: No, score=0.10
X-Stat-Signature: bag15ygnb7zycjmij7n8krsg37adfghn
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+Z1DWOQKC1GCVRxp1buSNRLZLwazhnR2M=
X-HE-Tag: 1637103495-673145
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
Cc: amakhalov@vmware.com, Ronak Doshi <doshir@vmware.com>,
 linux-scsi@vger.kernel.org, anishs@vmware.com,
 Vishal Bhakta <vbhakta@vmware.com>, netdev@vger.kernel.org, sdeep@vmware.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 keerthanak@vmware.com, linux-rdma@vger.kernel.org,
 linux-graphics-maintainer@vmware.com, srivatsab@vmware.com, kuba@kernel.org,
 linux-input@vger.kernel.org, Nadav Amit <namit@vmware.com>,
 Vivek Thampi <vithampi@vmware.com>, rostedt@goodmis.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2021-11-16 at 14:41 -0800, Srivatsa S. Bhat wrote:
> From: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
> 
> VMware mailing lists in the MAINTAINERS file are private lists meant
> for VMware-internal review/notification for patches to the respective
> subsystems. Anyone can post to these addresses, but there is no public
> read access like open mailing lists, which makes them more like email
> aliases instead (to reach out to reviewers).
> 
> So update all the VMware mailing list references in the MAINTAINERS
> file to mark them as such, using "R: email-alias@vmware.com".
> 
> Signed-off-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>

Acked-by: Joe Perches <joe@perches.com>

> diff --git a/MAINTAINERS b/MAINTAINERS
[]
> @@ -6223,8 +6223,8 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/vboxvideo/
>  
>  DRM DRIVER FOR VMWARE VIRTUAL GPU
> -M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
>  M:	Zack Rusin <zackr@vmware.com>
> +R:	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>

etc...


