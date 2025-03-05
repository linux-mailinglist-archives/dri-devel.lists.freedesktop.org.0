Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4FFA50EE5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 23:44:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B369410E840;
	Wed,  5 Mar 2025 22:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FFjhWvcF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD36C10E83D;
 Wed,  5 Mar 2025 22:44:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6DB065C6CB4;
 Wed,  5 Mar 2025 22:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F944C4CED1;
 Wed,  5 Mar 2025 22:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741214685;
 bh=m+B22u9Aqj6/oDms5/yYBB6yk0CyqE6jQ8Qo7nxZEz4=;
 h=From:Subject:Date:To:Cc:From;
 b=FFjhWvcFxBohFFaqD3LiFL+FdhkfEmUpRkJIHMKGKdRaMkUsdocvytFWjgwG3iz+O
 HXgRqTT1npyFgJqwrBjc1AirrnwGhV/OnIXBnsl8xL9Un+zsidWQO8hRTHSg/mh9A2
 miFe6iYUUXRS3V0irt1HivQ+/iXFY/6blTGvHFABmL9XmcmJkmrhK6ACTB/js8QaR1
 aJPRTXHERtH1cjRS27Mqbwh+EcenIDeGE7DpvE6o+rQ9KPzBVAvtAC68b5BYWoZM06
 cIJ3cFFv52MsvPOtr06Hm6VKG6GdE/bjLxO3aXIDbVZJoSUAzfS/6ZTGc8ffZ9SzSC
 bkPX00f8eaBlg==
From: Dmitry Baryshkov <lumag@kernel.org>
Subject: [PATCH 0/2] MAINTAINERS: update my email address
Date: Thu, 06 Mar 2025 00:44:35 +0200
Message-Id: <20250306-update-email-v1-0-9a231571e905@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANPTyGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwMz3dKClMSSVN3U3MTMHF3TREMLi8Tk1JQ0CxMloJaCotS0zAqwcdG
 xtbUA9UbI6V4AAAA=
X-Change-ID: 20250306-update-email-5a188acedf84
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=636; i=lumag@kernel.org;
 h=from:subject:message-id; bh=m+B22u9Aqj6/oDms5/yYBB6yk0CyqE6jQ8Qo7nxZEz4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnyNPawLxw7i/5YgqCcD75ZhMf+oY1DZmqYqm/4
 BuaxE93y7iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8jT2gAKCRCLPIo+Aiko
 1dNhB/99EOuC2OYCMOYy3nK9ZnP/MCqYIGiG2oEWf2uRlYsXyieS460JZctwU3uze7EqIMH02c0
 WN3DqgHrBCUZQNecVhyTXruW6iA73fK0XJnMVguRU8J4ubSW4Pkz3Q4sUSIHMBAgh2Hrdrms8jn
 nBJ/LSrbol8jX4FLsyJpzPp70PVsbjxpr4+iXCKP6VkNV5Rf2CYoFJCEW9mGv+BMCCkAK1WiNcF
 HaPuGUQczB36mDu9A+GFGeDVJC+tPZPLsgbfBgJjVCqTrUXrjdoCE6CXS96MIq9UeeSBUUpm/F2
 geYF3cs20Mxoy1Ab9az4xNMY+CfJIriSdoELLIqa7t891o4/
X-Developer-Key: i=lumag@kernel.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Update .mailmap and MAINTAINERS to point to the @kernel.org instead of
the @linaro.org. Linaro address will stop working in several days.

Rob, could you please pick these two patches?

Signed-off-by: Dmitry Baryshkov <lumag@kernel.org>
---
Dmitry Baryshkov (2):
      MAINTAINERS: use kernel.org alias
      mailmap: remap all addresses to kernel.org alias

 .mailmap    | 9 +++++----
 MAINTAINERS | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)
---
base-commit: 20d5c66e1810e6e8805ec0d01373afb2dba9f51a
change-id: 20250306-update-email-5a188acedf84

Best regards,
-- 
Dmitry Baryshkov <lumag@kernel.org>

