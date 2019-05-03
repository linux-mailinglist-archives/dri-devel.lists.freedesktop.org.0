Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4548B12973
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 10:04:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C732C89842;
	Fri,  3 May 2019 08:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B282889842
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 08:04:23 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s15so6565947wra.12
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2019 01:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=usS8qetQNJptVgiMIqyWjJsqPLkTF8EDGgFQhkU1ojs=;
 b=ciTFhShyyIBX/Uu+Y2F4X3pn6kxaOHT7IFHYQcIwzG3ppUQm0jt5QkzsfWIOnREw5y
 xJthKDMhq7fb53iout34SeHjc89A/F90CI2fvI1G6RQdfuV9vGLu01JBgbxVhYLJN+At
 vBbSge5uyk9vSE7UlK7SdwwWZxn8AaY0R2bou3y/OL9jYgzZrJD3o9NZWt629mDEvgXG
 tU6TZhoV/ybJusMaxSxFHj/RtkshRMP3peczwjHUzAEc/WQrj9ayfUGeAQ+Ue8rntYit
 k7jKK79PuFA0L5nkwKsHvso5sh2nuBh6+mkK+G+Djs9/per1l0M1dpH9jk2pBb0Cgoxj
 3LOA==
X-Gm-Message-State: APjAAAUqe7CdScD66W8BMWdTOf2OCdQNAQr5gOAH/hDIxVf1s5+cDFzt
 /K5xkxvqv8F82VFm4d/1TBdKbiyQ
X-Google-Smtp-Source: APXvYqwsW7eiVdX0xiFGIl1ZWVItZBuS63w/gi9bn2f3ECdN+oYy0r362s2J2KO7CzZruKryGGcYlw==
X-Received: by 2002:a05:6000:3:: with SMTP id h3mr5691983wrx.314.1556870662342; 
 Fri, 03 May 2019 01:04:22 -0700 (PDT)
Received: from ogabbay-VM.habana-labs.com ([31.154.190.6])
 by smtp.gmail.com with ESMTPSA id y6sm2690113wra.24.2019.05.03.01.04.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 01:04:21 -0700 (PDT)
From: Oded Gabbay <oded.gabbay@gmail.com>
To: alexdeucher@gmail.com,
	airlied@gmail.com
Subject: [PATCH 1/1] MAINTAINERS: update amdkfd maintainer
Date: Fri,  3 May 2019 11:04:08 +0300
Message-Id: <20190503080408.7799-2-oded.gabbay@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503080408.7799-1-oded.gabbay@gmail.com>
References: <20190503080408.7799-1-oded.gabbay@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=usS8qetQNJptVgiMIqyWjJsqPLkTF8EDGgFQhkU1ojs=;
 b=WijQY6Kf2dHoF9CR6dXhImby2vECJ7RgzJOqqHn8i3H+Gp9xhObX/+gO0f0NZAZHOB
 JLEOt8juAww8oBvF5TL29FjeAXfLYDX5PvPobPSvI6T/0uVLMo/ntN09/HNx7skd/e2z
 8gREg6JPboM3s0EOkPhbgz81AUv7BX/2BI/FeNiwA8Yon0WSPJZCZVBmumaA345P0b7W
 yRx7VcjXx/kEZXkRtU3uZau4MghqVML/AmPv5zmOB493C0gKNmWBxM5vdRTa45Bq3QDS
 269ufb1j6z17O9imk42IJsm6vkX6nGVsY0gggsVmooNOrJwuaAHyGT0++f/hAoAMaTCM
 WWeA==
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
Cc: dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

YW1ka2ZkIGlzIG5vdyBiZWluZyB1cHN0cmVhbWVkIHRvZ2V0aGVyIHdpdGggdGhlIGFtZGdwdSBk
cml2ZXIuIFRoZXJlZm9yZSwKdXBkYXRlIHRoZSBtYWludGFpbmVyIGVudHJ5IGZvciB0aGUgZHJp
dmVyIHdpdGggdGhlIG5hbWUgb2YgdGhlIGFtZGdwdQpkcml2ZXIgbWFpbnRhaW5lci4KClNpZ25l
ZC1vZmYtYnk6IE9kZWQgR2FiYmF5IDxvZGVkLmdhYmJheUBnbWFpbC5jb20+Ci0tLQogTUFJTlRB
SU5FUlMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA1YzM4
ZjIxYWVlNzguLjM3OTgyNDdkMDJjNiAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJ
TlRBSU5FUlMKQEAgLTc5OCw5ICs3OTgsOSBAQCBGOglkcml2ZXJzL2lvbW11L2FtZF9pb21tdSou
W2NoXQogRjoJaW5jbHVkZS9saW51eC9hbWQtaW9tbXUuaAogCiBBTUQgS0ZECi1NOglPZGVkIEdh
YmJheSA8b2RlZC5nYWJiYXlAZ21haWwuY29tPgorTToJQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hl
ckBnbWFpbC5jb20+CiBMOglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCi1UOglnaXQg
Z2l0Oi8vcGVvcGxlLmZyZWVkZXNrdG9wLm9yZy9+Z2FiYmF5by9saW51eC5naXQKK1Q6CWdpdCBn
aXQ6Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL35hZ2Q1Zi9saW51eAogUzoJU3VwcG9ydGVkCiBG
Oglkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkLmMKIEY6CWRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuaAotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
