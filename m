Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 393859A4E7
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 03:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051536E02C;
	Fri, 23 Aug 2019 01:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EA16E02C
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 01:33:59 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id v12so5852368oic.12
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 18:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=05URQWrJ6pkSO/F11TtS9cQrcO3EoggE+S4F03Cb4FA=;
 b=TMfWTQ8x5Jsf/R+2d74pXiBpamT5mW9GLsEAFGAjKxjr2iVMm4AjXSJ2nmHw1FgI4K
 z/jQPy/sVE6ezCyaJ4rnT3YBe0vFE+4qHvHmRv2WsyRowD2bzzeZbBynlXzmabYqpOBw
 fw+1T/pQcQfSnAzWwbujfiJiCCdS2cI7dXLp/+uhVjLIQGbKjCF+pmzTOY/yW12KBUEh
 m+8mZ5nsUWgDLIyfaXVymecGKg7OO4yWyp61SWlDxAHmXHHPOj3G7PGRQfG8e48jOoOC
 RyptJ8/3AaAGrlry/tDP2aPotnB8mnc1s0WTBKxLxTumuq6JNqxgQqZ9AJH8Ac+J5F0j
 EjJw==
X-Gm-Message-State: APjAAAW9KHb1SyT9P0tJIy7ICSwExcGVxZe8Qia4zETYktOBryh7q1G0
 Qdj2RLis4pvmLjbPRxZ/kuxFji0=
X-Google-Smtp-Source: APXvYqw9o3wOFS6bqTUleA+QWXQlJc/ik3xSIeSE9qzWUTFjJhEbERovJfex87Mrj1IHPwBewR6hQQ==
X-Received: by 2002:aca:3a55:: with SMTP id h82mr1492546oia.36.1566524038545; 
 Thu, 22 Aug 2019 18:33:58 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id h197sm467843oib.14.2019.08.22.18.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 18:33:58 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Add Steven and Alyssa as panfrost reviewers
Date: Thu, 22 Aug 2019 20:33:57 -0500
Message-Id: <20190823013357.932-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIFN0ZXZlbiBQcmljZSBhbmQgQWx5c3NhIFJvc2VuendlaWcgYXMgcmV2aWV3ZXJzIGFzIHRo
ZXkgaGF2ZSBiZWVuIHRoZQpwcmltYXJ5IHJldmlld2VycyBhbHJlYWR5LgoKQ2M6IFN0ZXZlbiBQ
cmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+CkNjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3Nh
LnJvc2VuendlaWdAY29sbGFib3JhLmNvbT4KQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3Nv
QGNvbGxhYm9yYS5jb20+ClNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Ci0tLQogTUFJTlRBSU5FUlMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCA2N2I3NWZj
MzNjNjEuLjI4ZjRhMjA5NDBjYiAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJTlRB
SU5FUlMKQEAgLTEyNTUsNiArMTI1NSw4IEBAIEY6CURvY3VtZW50YXRpb24vZ3B1L2FmYmMucnN0
CiBBUk0gTUFMSSBQQU5GUk9TVCBEUk0gRFJJVkVSCiBNOglSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgogTToJVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KK1I6
CVN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+CitSOglBbHlzc2EgUm9zZW56d2Vp
ZyA8YWx5c3NhLnJvc2VuendlaWdAY29sbGFib3JhLmNvbT4KIEw6CWRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKIFM6CVN1cHBvcnRlZAogVDoJZ2l0IGdpdDovL2Fub25naXQuZnJlZWRl
c2t0b3Aub3JnL2RybS9kcm0tbWlzYwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
