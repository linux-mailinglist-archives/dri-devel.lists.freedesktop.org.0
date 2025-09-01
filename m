Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B30BB3DCFA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 10:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E2EB10E3AF;
	Mon,  1 Sep 2025 08:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DCE10E3AE
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 08:49:20 +0000 (UTC)
Received: from jtjnmail201610.home.langchao.com
 by unicom145.biz-email.net ((D)) with ASMTP (SSL) id 202509011649157731;
 Mon, 01 Sep 2025 16:49:15 +0800
Received: from localhost.localdomain.com (10.94.9.187) by
 jtjnmail201610.home.langchao.com (10.100.2.10) with Microsoft SMTP Server id
 15.1.2507.57; Mon, 1 Sep 2025 16:49:14 +0800
From: chuguangqing <chuguangqing@inspur.com>
To: Koby Elbaz <koby.elbaz@intel.com>, Konstantin Sinyuk
 <konstantin.sinyuk@intel.com>, Oded Gabbay <ogabbay@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 chuguangqing <chuguangqing@inspur.com>
Subject: [PATCH 0/1] fix typo error in
Date: Mon, 1 Sep 2025 16:47:41 +0800
Message-ID: <20250901084742.1935-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.9.187]
tUid: 202590116491563ba7ba9caaa19f792d2b2005647f4a6
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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

The word "properties" was misspelled as "properites".

chuguangqing (1):
  accel/habanalabs: fix typo in comment

 drivers/accel/habanalabs/common/habanalabs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.5

