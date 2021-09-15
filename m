Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC6D40C766
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 16:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16B16E949;
	Wed, 15 Sep 2021 14:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931D96E949
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 14:24:35 +0000 (UTC)
Date: Wed, 15 Sep 2021 14:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail; t=1631715869;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=GXX6r9vAkyn6nrme2xPq+eRNxvzkf22UcZA5bwMEIZoXhXtryoGIbEop85tXlplNg
 KaHHnY0v7BU17LNcJ4hd/w4NMEjsKznJk0P15C9n4fiOnwvCnCn0apN3k+2/foaJ/r
 5ZguSO0uaRrPGwaEiJGT9kX/gzvhAAGHngpZQ46U162KOxQxrtIya/x2zEMkxYeuhh
 3E1kstw5fnEPeNKc5L+CI5dYRA2RMMZt/yNI1XEo4yWnIgSgaRnL8YYq1ARiMQUe1x
 QFZa2DuRZjaGrbJQ3KccGhN60gSB15xoxuYPaeI90wfxV67B52Gpg2l45qxuPaeLX+
 HBoPP6NAKpFpQ==
To: Ville Syrjala <ville.syrjala@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Fix scaling_mode docs
Message-ID: <V7ZvvFwmwyoSg66Rm5PR0Y1YYa8QAvz9FdlvEVPTb3aoSFlMht6NrWhSkPeIAIhN85v7aMbiQCE_QwLAY9Ucf3kkHDKiGLCzQYT_GG4PZrE=@emersion.fr>
In-Reply-To: <20210915142300.15631-1-ville.syrjala@linux.intel.com>
References: <20210915142300.15631-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Simon Ser <contact@emersion.fr>
