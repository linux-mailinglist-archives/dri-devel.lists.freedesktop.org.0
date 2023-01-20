Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CE6675DAD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 20:10:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B4B10E398;
	Fri, 20 Jan 2023 19:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DAD10E397;
 Fri, 20 Jan 2023 19:10:14 +0000 (UTC)
Received: from maud (138-51-93-140-lsn-2.nat.utoronto.ca [138.51.93.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: alyssa)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 956426602C2E;
 Fri, 20 Jan 2023 19:10:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674241813;
 bh=y7ORUcqQixVbem7IIN7xIeUJfgQseVpdMnJ2yyXfH1g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OYJnihk6WnaS/cqw5/Ll7vFqkFxxNlB07omqIB0DzN5JLpeJelwxo/s17uFRx7Fui
 1X1CKZjTT0rNHZeQ+wsXOIZki7sWLvUJ+/jK/ambfp151Sj57+5hvbT27cbJRvgBV/
 YSAdNfgH5KMqB5qAFu6IzumMsMKB+QoHf4QHV4pr0qfNwDLg34N0Oywk/bPTVlh3wq
 JRBD34V7OpFD3yA+RBBgpNdA+/GifLugBUzf/mkiwctu4qCTiKJ9dQLZjznLNg89eC
 XIS+wt35UD+ycNsawmy/lImfcuvdHOAMsO8hk34hzvos94Q1hmkMbXcf3JDDYFqdEa
 nb7f6IIPpuASg==
Date: Fri, 20 Jan 2023 14:10:08 -0500
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Eric Engestrom <eric@engestrom.ch>
Subject: Re: Retiring the GitHub mirrors
Message-ID: <Y8rnEFATJYmwyeDr@maud>
References: <20230120183351.nl2ddcvmfz3aptwg@engestrom.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230120183351.nl2ddcvmfz3aptwg@engestrom.ch>
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
Cc: mesa-dev@lists.freedesktop.org, freedesktop@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> Among the people present in this discussion, the consensus was that we
> should delete them.

I wasn't present but +1 from me.
