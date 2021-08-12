Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FDC3EA6D1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 16:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F726E419;
	Thu, 12 Aug 2021 14:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798B46E419
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 14:51:26 +0000 (UTC)
Date: Thu, 12 Aug 2021 14:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1628779883;
 bh=dJZln88lN2ZOtbXwmt+yMlSaTT1Nk8VC901yTzLI2ig=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=KLOFaP0s1f0ocgeaz4e2Zh/HY94dHrmDe0/E6aATBjIet5yDwyadmMuJmQgeSIRxP
 7/hE0jqgjtMnG5SEDgzJP1LFNco13ag4901yf68z1Glb2O+0r7D4PlZMfVXcCOsQCg
 IsW7ubJIwl4vlme78lQeYNXT25HpcPKLRMyk8klD/zz4Q+LslAk0QXx5QYpiABgN2G
 ZZQaFiz4K3LvE4H939Qg6S6FQ8GgAiOdqMbfLWhxNB6Ji1EKK5BIiInNvpCD/gCF1L
 2IvA7TJBdlF3Vbh3TFLBIIJjcOqPUJOnFrvEQ0tM3glTWLye+XYIHUJAuEoDYeejzr
 OF38flwcTUODA==
To: Lucas De Marchi <lucas.demarchi@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, airlied@redhat.com
Subject: Re: [PATCH] drm/edid: fix edid field name
Message-ID: <uzYqkXddOTdP6iYO9qnYbv0IDpBQVpm-GVq1NoAueYQGou5UoV-A5q_ZsEre7YFOET2ZfAKUi23cJ7W3u62J4Y97cVHLifE3MZqRJQGjL6k=@emersion.fr>
In-Reply-To: <20210811233202.6wqtlmum4wjavaat@ldmartin-desk2>
References: <20210811205818.156100-1-lucas.demarchi@intel.com>
 <fNYfXtEqPuvThfQgTb62cr8mjJl9SOGfXX02gNF9b0FmpcvY5b-c1EiJrtJQio_j64_0t0EVnOpfkLctibSPbmH2q6YtWbc9Ct3BNqrOnuA=@emersion.fr>
 <20210811233202.6wqtlmum4wjavaat@ldmartin-desk2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pushed to drm-misc-next, thanks!
