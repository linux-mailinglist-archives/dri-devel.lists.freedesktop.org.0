Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3EC167BAE
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:14:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C04A6F3F1;
	Fri, 21 Feb 2020 11:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22186ED05
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 09:03:47 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q9so1105171wmj.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 01:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rjbvQtNqioDF7ju5/qowPwbp/hzQgZZy37V1zQzWfsk=;
 b=SQ6eKHukuamIGMVRbS8GF+jTMkGasoLwr2dxpvjE1WA2nEKfNRWGsQo13/V21Bq87R
 gEertchuFUrSwTLc1i7U6pYPNkJxWFT3KU8JGs9WjzxDMkNlQgxM2QuQqkF7HV8ZB5yI
 yRYU1PpEVm3z/iP8U2Kwkyyy2M1NuTwfS0S0xLHJphw42GQGbo4wbEqjHX6dph0ahaMi
 rKPuTiFO2zjfY5CRuOt9kOuaX8WrRN3yYVMDFFcpxO59BfOCCgkIu8UTWkv7z5B2TM0q
 uT7XcKrQhKR7AZMWl0kYAOyPuQCwNKetUDIX31kelyLrEuzts7nu8FtTiPCuw4k3XX4j
 P5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rjbvQtNqioDF7ju5/qowPwbp/hzQgZZy37V1zQzWfsk=;
 b=hVwcc/J+ajO3o0MxjyVWO1cLZuCoy6+6RB+pc8yep3WSE6VMB1v8Hr4nmzI77KGm7x
 tWvU9RDvd+01ldIZNav9UaNbZUh7Dh0YkcCElIjOaMsf7WjO9G2MUhCojp+sfvytjKNN
 2kGm7OtuplsOBtErrMg7bf85OUlRYfU//r74PXhi1yG0Kr3L0Nd29Nqn1BrC0L+Jysa9
 uabhM6wIo1/eP9L8ni33XMyX74Hlo1g1gggHLWjUknN2dfbXCh8F7K7gLGguERemfa7T
 1t0zcDxSOn6jPIyOC80puec9qOm2GZZ8MypEkufc5phwa0onF9yxAZe91pA+GxKznqnF
 kCoQ==
X-Gm-Message-State: APjAAAXP/pnlbUHncxUsVoZKmBDRlrwPdjxfo8CSE9+nOzPqVv4ZefVD
 Vlk55TiVnFLCelOLJmacLygBhGOJNTVfew==
X-Google-Smtp-Source: APXvYqwkxjG6hjf0R8OUpCHYYgwzw7QXfmrl8aICf909ypJ/C+oNeSw0Cy3C1ORynwimGjSUcTZQqQ==
X-Received: by 2002:a1c:e246:: with SMTP id z67mr3354892wmg.52.1582189426247; 
 Thu, 20 Feb 2020 01:03:46 -0800 (PST)
Received: from localhost.localdomain ([213.146.143.36])
 by smtp.gmail.com with ESMTPSA id 4sm3496201wmg.22.2020.02.20.01.03.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Feb 2020 01:03:45 -0800 (PST)
From: Xinliang Liu <xinliang.liu@linaro.org>
To: dri-devel@lists.freedesktop.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] MAINTAINERS: Update myself email address
Date: Thu, 20 Feb 2020 09:03:28 +0000
Message-Id: <20200220090328.25932-1-xinliang.liu@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
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
Cc: xinliang.liu@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update myself email address.
Add John Stultz as a reviewer. Thanks John.
Update git tree to drm-misc

Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 978766c6715e..befc3c0afc75 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5600,12 +5600,13 @@ S:	Maintained
 F:	drivers/gpu/drm/gma500/
 
 DRM DRIVERS FOR HISILICON
-M:	Xinliang Liu <z.liuxinliang@hisilicon.com>
+M:	Xinliang Liu <xinliang.liu@linaro.org>
 M:	Rongrong Zou <zourongrong@gmail.com>
+R:	John Stultz <john.stultz@linaro.org>
 R:	Xinwei Kong <kong.kongxinwei@hisilicon.com>
 R:	Chen Feng <puck.chen@hisilicon.com>
 L:	dri-devel@lists.freedesktop.org
-T:	git git://github.com/xin3liang/linux.git
+T:	git git://anongit.freedesktop.org/drm/drm-misc
 S:	Maintained
 F:	drivers/gpu/drm/hisilicon/
 F:	Documentation/devicetree/bindings/display/hisilicon/
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
