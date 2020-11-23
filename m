Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158C42BFDC7
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 01:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D88DD89B45;
	Mon, 23 Nov 2020 00:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay.hostedemail.com (smtprelay0045.hostedemail.com
 [216.40.44.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39AE589B3B;
 Mon, 23 Nov 2020 00:54:06 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id 2D37318029125;
 Mon, 23 Nov 2020 00:54:05 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:2911:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3872:4250:4321:4425:5007:6119:6691:6742:6743:7903:10004:10400:10848:11026:11232:11658:11914:12296:12297:12555:12740:12760:12895:13069:13161:13229:13311:13357:13439:14659:14721:21080:21433:21627:21740:30041:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: steam95_4513bd127361
X-Filterd-Recvd-Size: 3177
Received: from XPS-9350.home (unknown [47.151.128.180])
 (Authenticated sender: joe@perches.com)
 by omf02.hostedemail.com (Postfix) with ESMTPA;
 Mon, 23 Nov 2020 00:53:59 +0000 (UTC)
Message-ID: <21826b6d513c4d9ccc795179c1edb0df2361d870.camel@perches.com>
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
From: Joe Perches <joe@perches.com>
To: Finn Thain <fthain@telegraphics.com.au>
Date: Sun, 22 Nov 2020 16:53:58 -0800
In-Reply-To: <alpine.LNX.2.23.453.2011230810210.7@nippy.intranet>
References: <20201121165058.1644182-1-trix@redhat.com>
 <20201122032304.GE4327@casper.infradead.org>
 <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
 <20201122145635.GG4327@casper.infradead.org>
 <0819ce06-c462-d4df-d3d9-14931dc5aefc@redhat.com>
 <751803306cd957d0e7ef6a4fc3dbf12ebceaba92.camel@HansenPartnership.com>
 <dec07021e7fc11a02b14c98b713ae2c6e2a4ca00.camel@perches.com>
 <alpine.LNX.2.23.453.2011230810210.7@nippy.intranet>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 Tom Rix <trix@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 ibm-acpi-devel@lists.sourceforge.net, keyrings@vger.kernel.org,
 linux-mtd@lists.infradead.org, Matthew Wilcox <willy@infradead.org>,
 linux-scsi@vger.kernel.org, clang-built-linux@googlegroups.com,
 amd-gfx@lists.freedesktop.org, cluster-devel@redhat.com,
 linux-acpi@vger.kernel.org, tboot-devel@lists.sourceforge.net,
 coreteam@netfilter.org, xen-devel@lists.xenproject.org,
 MPT-FusionLinux.pdl@broadcom.com, linux-media@vger.kernel.org,
 alsa-devel@alsa-project.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-omap@vger.kernel.org, devel@acpica.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
 linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-11-23 at 09:33 +1100, Finn Thain wrote:
> On Sun, 22 Nov 2020, Joe Perches wrote:

> > But provably correct conversions IMO _should_ be done and IMO churn 
> > considerations should generally have less importance.
[]
> Moreover, the patch review workload for skilled humans is being generated 
> by the automation, which is completely backwards: the machine is supposed 
> to be helping.

Which is why the provably correct matters.

coccinelle transforms can be, but are not necessarily, provably correct.

The _show transforms done via the sysfs_emit_dev.cocci script are correct
as in commit aa838896d87a ("drivers core: Use sysfs_emit and sysfs_emit_at
for show(device *...) functions")

Worthwhile?  A different question, but I think yes as it reduces the
overall question space of the existing other sprintf overrun possibilities.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
