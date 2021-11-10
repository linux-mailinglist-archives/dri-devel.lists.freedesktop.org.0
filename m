Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB2744CA13
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 21:05:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105FA6E8F4;
	Wed, 10 Nov 2021 20:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu
 [128.30.2.210])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3FFF16E8F4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 20:05:52 +0000 (UTC)
Received: from [128.177.79.46] (helo=[10.118.101.22])
 by outgoing-stata.csail.mit.edu with esmtpsa
 (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.82)
 (envelope-from <srivatsa@csail.mit.edu>)
 id 1mktqx-000YXB-Rb; Wed, 10 Nov 2021 15:05:51 -0500
Subject: [PATCH v3 3/3] MAINTAINERS: Mark VMware mailing list entries as
 email aliases
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: jgross@suse.com, x86@kernel.org, pv-drivers@vmware.com
Date: Wed, 10 Nov 2021 12:09:06 -0800
Message-ID: <163657493334.84207.11063282485812745766.stgit@srivatsa-dev>
In-Reply-To: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
References: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Ronak Doshi <doshir@vmware.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, namit@vmware.com,
 amakhalov@vmware.com, srivatsa@csail.mit.edu, srivatsab@vmware.com,
 sdeep@vmware.com, Vishal Bhakta <vbhakta@vmware.com>,
 linux-graphics-maintainer@vmware.com, linux-input@vger.kernel.org,
 kuba@kernel.org, rostedt@goodmis.org, keerthanak@vmware.com,
 linux-scsi@vger.kernel.org, anishs@vmware.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, joe@perches.com,
 vithampi@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>

VMware mailing lists in the MAINTAINERS file are private lists meant
for VMware-internal review/notification for patches to the respective
subsystems. Anyone can post to these addresses, but there is no public
read access like open mailing lists, which makes them more like email
aliases instead (to reach out to reviewers).

So update all the VMware mailing list references in the MAINTAINERS
file to mark them as such, using "R: email-alias@vmware.com".

Signed-off-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
Cc: Zack Rusin <zackr@vmware.com>
Cc: Nadav Amit <namit@vmware.com>
Cc: Vivek Thampi <vithampi@vmware.com>
Cc: Vishal Bhakta <vbhakta@vmware.com>
Cc: Ronak Doshi <doshir@vmware.com>
Cc: pv-drivers@vmware.com
Cc: linux-graphics-maintainer@vmware.com
Cc: dri-devel@lists.freedesktop.org
Cc: linux-rdma@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-input@vger.kernel.org
---

 MAINTAINERS |   22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 21c0e49b80b9..073e00ef9434 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6134,8 +6134,8 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/vboxvideo/
 
 DRM DRIVER FOR VMWARE VIRTUAL GPU
-M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
 M:	Zack Rusin <zackr@vmware.com>
+R:	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
@@ -14189,7 +14189,7 @@ F:	include/uapi/linux/ppdev.h
 PARAVIRT_OPS INTERFACE
 M:	Juergen Gross <jgross@suse.com>
 M:	Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
-M:	"VMware, Inc." <pv-drivers@vmware.com>
+R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	virtualization@lists.linux-foundation.org
 L:	x86@kernel.org
 S:	Supported
@@ -20032,7 +20032,7 @@ F:	tools/testing/vsock/
 
 VMWARE BALLOON DRIVER
 M:	Nadav Amit <namit@vmware.com>
-M:	"VMware, Inc." <pv-drivers@vmware.com>
+R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/misc/vmw_balloon.c
@@ -20040,7 +20040,7 @@ F:	drivers/misc/vmw_balloon.c
 VMWARE HYPERVISOR INTERFACE
 M:	Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
 M:	Alexey Makhalov <amakhalov@vmware.com>
-M:	"VMware, Inc." <pv-drivers@vmware.com>
+R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	virtualization@lists.linux-foundation.org
 L:	x86@kernel.org
 S:	Supported
@@ -20050,14 +20050,14 @@ F:	arch/x86/kernel/cpu/vmware.c
 
 VMWARE PVRDMA DRIVER
 M:	Adit Ranadive <aditr@vmware.com>
-M:	VMware PV-Drivers <pv-drivers@vmware.com>
+R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	linux-rdma@vger.kernel.org
 S:	Maintained
 F:	drivers/infiniband/hw/vmw_pvrdma/
 
 VMware PVSCSI driver
 M:	Vishal Bhakta <vbhakta@vmware.com>
-M:	VMware PV-Drivers <pv-drivers@vmware.com>
+R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	linux-scsi@vger.kernel.org
 S:	Maintained
 F:	drivers/scsi/vmw_pvscsi.c
@@ -20065,7 +20065,7 @@ F:	drivers/scsi/vmw_pvscsi.h
 
 VMWARE VIRTUAL PTP CLOCK DRIVER
 M:	Vivek Thampi <vithampi@vmware.com>
-M:	"VMware, Inc." <pv-drivers@vmware.com>
+R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/ptp/ptp_vmw.c
@@ -20073,15 +20073,15 @@ F:	drivers/ptp/ptp_vmw.c
 VMWARE VMCI DRIVER
 M:	Jorgen Hansen <jhansen@vmware.com>
 M:	Vishnu Dasa <vdasa@vmware.com>
+R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	linux-kernel@vger.kernel.org
-L:	pv-drivers@vmware.com (private)
 S:	Maintained
 F:	drivers/misc/vmw_vmci/
 
 VMWARE VMMOUSE SUBDRIVER
 M:	Zack Rusin <zackr@vmware.com>
-M:	"VMware Graphics" <linux-graphics-maintainer@vmware.com>
-M:	"VMware, Inc." <pv-drivers@vmware.com>
+R:	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>
+R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/input/mouse/vmmouse.c
@@ -20089,7 +20089,7 @@ F:	drivers/input/mouse/vmmouse.h
 
 VMWARE VMXNET3 ETHERNET DRIVER
 M:	Ronak Doshi <doshir@vmware.com>
-M:	pv-drivers@vmware.com
+R:	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/vmxnet3/

