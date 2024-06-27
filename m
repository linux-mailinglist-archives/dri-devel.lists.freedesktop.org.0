Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB46891A604
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 14:01:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9139110E0C1;
	Thu, 27 Jun 2024 12:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dG5i+z1Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A57710E0C1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 12:01:26 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6327e303739so74909807b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 05:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719489685; x=1720094485; darn=lists.freedesktop.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=sLFs+ADtPAA/pAegdFKWnMvAxwSipWrKl8O9Idg9d9I=;
 b=dG5i+z1YiT5sfyna141wb7COxdq83BL7gxvV6fgLFImiDYIr4A0ae9nUWPNK/qjv/d
 YDR31owHsZCs3nfVY/sS28vLEt/s8zRxyiPSULjP1bWQujniXYP8Ly86MbNmdeNo3rTQ
 APnuZS4ruTs6HB4BtxRwifxT/OWVwkK8riBIMOKFb1tY735YRlidIvwSfSM21LFBTaZR
 wsb20e4nKaW8LTowX379ic6JRxynPOe78oYPRHHevMaNMFbUtDJD09rY/rpbXEFLe03f
 rngCwsvvjh3qugw9MIMzxV0adXk1j9k3aZ+a6enGrRpPAWXxTBX/MFycMsXg5wAsuZiP
 f7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719489685; x=1720094485;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sLFs+ADtPAA/pAegdFKWnMvAxwSipWrKl8O9Idg9d9I=;
 b=PuX0ON1V2XMMK1y52UaqqohnakVygwv2BYlaStiIwdnV9038e5MXfCiOT6gctShdW/
 Rols0i+hreEjWeQ6kVNrerI7bypWT04/NdCfzMHeWpyjVyNsPlcx4LpkH9zCxZLZizZR
 XanNBsKQ07FsTW8MRZYYqxEx0cDwBo8hdSH1fY4Pc6LKizqSr1kQnggocrcGrNgXs1BM
 MWHZ7rMZ8VAvayjxHBO4dA4dvK4SQMYy7XBAtdAH/oFEB4LE/DqvOdB/hutcmkJl6eWV
 z5BJsjMgj8tGOPUPMN4zIP58AxMGcUvjKP33S2WQyC+I4edMxlUYDWKm1EgVlDpAhdvL
 1sBw==
X-Gm-Message-State: AOJu0Yxx5yecvmZexcJCuT7RwzfRCJ2LNcK4soH9lQpoWl0u/afOVHOo
 4FO8FbcI7dLcZkfe9YFGMNggn1JHViOaVhpXRS6xM8+VX68rjSsVSDjeQvYSQdoLlmIh9etvOqX
 7Q/OBEdeNVAaWbhFSb6WmPUgAlXFOzeBl
X-Google-Smtp-Source: AGHT+IFUcMPuDAsI/a6fznfkDbkh3sSCVbKeZvGW35BbP/YHOGhwHc47HJoct3EnUxeJI+ci6KL+Yx5nGO/O5twD2tA=
X-Received: by 2002:a0d:e657:0:b0:630:f7c9:80d6 with SMTP id
 00721157ae682-643aa6990fdmr124466947b3.27.1719489684621; Thu, 27 Jun 2024
 05:01:24 -0700 (PDT)
MIME-Version: 1.0
From: Rupam Saha <rupamthxt@gmail.com>
Date: Thu, 27 Jun 2024 17:31:13 +0530
Message-ID: <CAJOAqGXT5iHQxWm7KL9JQ-psQ4CbJuRLw5KVOTBS2zzCsT+1cA@mail.gmail.com>
Subject: Enquiry for internship and working on a project.
To: dri-devel@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000d8d5f6061bdde35f"
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

--000000000000d8d5f6061bdde35f
Content-Type: text/plain; charset="UTF-8"

I am writing this as I was taking a look at the open projects at X.org and
found out about the DRM project. I am a newbie in kernel development but
willing to work as an intern on this project. I hope I can get some
insights about how to proceed in this regard.

Warm regards,
Rupam

--000000000000d8d5f6061bdde35f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am writing this as I was taking a look at the open proje=
cts at X.org and found out about the DRM project. I am a newbie in kernel d=
evelopment but willing to work as an intern on this=C2=A0project. I hope I =
can get some insights about how to proceed=C2=A0in this regard.<br><div><br=
></div><div>Warm regards,</div><div>Rupam</div></div>

--000000000000d8d5f6061bdde35f--
