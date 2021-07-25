Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7F33D4E38
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 17:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A756E3F7;
	Sun, 25 Jul 2021 15:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rosenzweig.io (unknown [138.197.143.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73BA26E3F7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 15:07:47 +0000 (UTC)
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] maintainers: Update freedesktop.org IRC channels
Date: Sun, 25 Jul 2021 11:00:07 -0400
Message-Id: <20210725150007.2818-2-alyssa@rosenzweig.io>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210725150007.2818-1-alyssa@rosenzweig.io>
References: <20210725150007.2818-1-alyssa@rosenzweig.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Like many free software projects, freedesktop.org issued a non-binding
recommendation for projects to migrate from Freenode to OFTC [1]. As
such, freedesktop.org entries in the MAINTAINERS file are out-of-date as
the respective channels have moved. Update the file to point to the
right network.

v2: Correct typo in commit message pointed out by Lukas and Jonathan.
Add Hector's ack.

v3: Add acks.

[1] https://lists.freedesktop.org/archives/dri-devel/2021-May/307605.html

Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Acked-By: Hector Martin <marcan@marcan.st>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Lukas Wunner <lukas@wunner.de>
Cc: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
Cc: linux-kernel@vger.kernel.org
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b706dd20f..3349c2338 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1651,7 +1651,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	https://asahilinux.org
 B:	https://github.com/AsahiLinux/linux/issues
-C:	irc://chat.freenode.net/asahi-dev
+C:	irc://irc.oftc.net/asahi-dev
 T:	git https://github.com/AsahiLinux/linux.git
 F:	Documentation/devicetree/bindings/arm/apple.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
@@ -5970,7 +5970,7 @@ M:	Daniel Vetter <daniel@ffwll.ch>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 B:	https://gitlab.freedesktop.org/drm
-C:	irc://chat.freenode.net/dri-devel
+C:	irc://irc.oftc.net/dri-devel
 T:	git git://anongit.freedesktop.org/drm/drm
 F:	Documentation/devicetree/bindings/display/
 F:	Documentation/devicetree/bindings/gpu/
@@ -9118,7 +9118,7 @@ S:	Supported
 W:	https://01.org/linuxgraphics/
 Q:	http://patchwork.freedesktop.org/project/intel-gfx/
 B:	https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs
-C:	irc://chat.freenode.net/intel-gfx
+C:	irc://irc.oftc.net/intel-gfx
 T:	git git://anongit.freedesktop.org/drm-intel
 F:	Documentation/gpu/i915.rst
 F:	drivers/gpu/drm/i915/
-- 
2.30.2

