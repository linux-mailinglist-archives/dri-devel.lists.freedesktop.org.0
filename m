Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E21B6D62FA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:51:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E4C89BD5;
	Mon, 14 Oct 2019 12:51:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C84E89BD5
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:50:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j18so19578754wrq.10
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yr6ddMFHeDLCntvNYa+hL2al/dJdqvTJul7jaQ0EH5g=;
 b=ouhD4s7ryig+p+HTnoGendKBWn6bDlkpJbjQv9I7/F8AFzp70NYvchWdb//miWeL5q
 Oupw+TJA/LAOldxST4193zkZF7a1X8KNG1S8l+44n32qrooWSSaqj3jw6dUS+RMvAXci
 7WyIKJFIFckFPrm0zTbcRnjqR5ksIS7mNF7MhNcH2MyHr4dwQy80/YyXccYd9dggPO+A
 pkpDjKvG6v4yfaAYFCFDBQkmjrUavxCRSc2euteXPM+qms3P0gd/MCs1WYPhaqysWodx
 8NoWDGBm09jD0SK/WEN2hiQDpdxN/ReGjkeCzTNbC6HyTvKdrwqUwth6fvIJnBRa3Pcc
 MS6g==
X-Gm-Message-State: APjAAAVp6Wwue+SN0/AB+0Mo6NiKpnsuuIgC678R+KJh5xSKzbwoR9Dd
 /ixy2Rfx0DnyzVVDxRuUbIw=
X-Google-Smtp-Source: APXvYqyBSiiaVUDINZz+bSWf6iQAgcfMBJ6K0a+ZRqvzYxwc7kK/NvnWt5L+YEufAc/q3Wmf5asHnA==
X-Received: by 2002:a5d:4dd2:: with SMTP id f18mr6981953wru.4.1571057455717;
 Mon, 14 Oct 2019 05:50:55 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id c9sm17126565wrt.7.2019.10.14.05.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:50:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 02/14] gpu: host1x: Remove gratuitous blank line
Date: Mon, 14 Oct 2019 14:50:37 +0200
Message-Id: <20191014125049.425101-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yr6ddMFHeDLCntvNYa+hL2al/dJdqvTJul7jaQ0EH5g=;
 b=U9lvx1cbTYbWS657zE2Tc9rYiIa1XQ1MvK29kpBkr6JoqEsLqBqomo1yYxydjNwu7o
 6ZFzChng8BZsMFQZlg0FYo2GZMKXp/45qGER/86iJjzyeao7kxsVVIyRuH9CUQJRRWi8
 7H/VSXdvlfmp+uVSLHPEiA2qdufh04/Bri8Fuit1+Goi+qmOpRk+Hm1vsv/tKTV01bPl
 Un91kXK9s5IN0rodlhj3N/01UIh/yKqCX2pMoIT43SOxPB2N8YZRlrwoJO0kn2bXAwBD
 gsCV4id8CQlLe6Iw095eUS+JNpglhZvEPaXyR+M7t9xgmTsE4RaYH5muI31iES5Y/K/j
 fi6Q==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClNpZ25lZC1vZmYtYnk6
IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvaG9z
dDF4L2ludHIuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9ob3N0MXgvaW50ci5jIGIvZHJpdmVycy9ncHUvaG9zdDF4L2ludHIu
YwppbmRleCAyNmYzYzc0MWQwODUuLjkyNDVhZGQyM2I1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvaG9zdDF4L2ludHIuYworKysgYi9kcml2ZXJzL2dwdS9ob3N0MXgvaW50ci5jCkBAIC0xMDUs
NyArMTA1LDYgQEAgc3RhdGljIHZvaWQgYWN0aW9uX3N1Ym1pdF9jb21wbGV0ZShzdHJ1Y3QgaG9z
dDF4X3dhaXRsaXN0ICp3YWl0ZXIpCiAJLyogIEFkZCBucl9jb21wbGV0ZWQgdG8gdHJhY2UgKi8K
IAl0cmFjZV9ob3N0MXhfY2hhbm5lbF9zdWJtaXRfY29tcGxldGUoZGV2X25hbWUoY2hhbm5lbC0+
ZGV2KSwKIAkJCQkJICAgICB3YWl0ZXItPmNvdW50LCB3YWl0ZXItPnRocmVzaCk7Ci0KIH0KIAog
c3RhdGljIHZvaWQgYWN0aW9uX3dha2V1cChzdHJ1Y3QgaG9zdDF4X3dhaXRsaXN0ICp3YWl0ZXIp
Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
